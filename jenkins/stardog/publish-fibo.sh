#!/bin/bash
#
# Publish the FIBO ontologies
#
# This script needs to be run in a Jenkins workspace, where two git repos are cloned:
#
# - fibo (in ${WORKSPACE}/fibo directory)
# - fibo-infra (in ${WORKSPACE}/fibo-infra directory)
#
#
tmp_dir="/tmp"
fibo_root=""
fibo_infra_root=""

spec_root="${WORKSPACE}/target"
family_root="${spec_root}/fibo"
product_root="${family_root}/ontology"
branch_root=""

stardog_vcs=""

rdftoolkit_jar="${WORKSPACE}/rdf-toolkit.jar"

shopt -s globstar

trap "rm -rf ${tmp_dir} >/dev/null 2>&1" EXIT

#
# This is for tools like pandoc
#
. /home/ec2-user/.nix-profile/etc/profile.d/nix.sh

function initWorkspaceVars() {

  tmp_dir=$(mktemp -d "${tmp_dir:-/tmp}/$(basename 0).XXXXXXXXXXXX")
  echo tmp_dir=${tmp_dir}

  fibo_root="${WORKSPACE}/fibo"
  echo "fibo_root=${fibo_root}"

  if [ ! -d "${fibo_root}" ] ; then
    echo "ERROR: fibo_root directory not found (${fibo_root})"
    return 1
  fi

  export fibo_infra_root="${WORKSPACE}/fibo-infra"
  echo fibo_infra_root=${fibo_infra_root}

  if [ ! -d "${fibo_infra_root}" ] ; then
    echo "ERROR: fibo_infra_root directory not found (${fibo_infra_root})"
    return 1
  fi

  rm -rf "${product_root}" >/dev/null 2>&1
  mkdir -p "${product_root}"

  if [ ! -f "${rdftoolkit_jar}" ] ; then
    echo "ERROR: Put the rdf-toolkit.jar in the workspace as a pre-build step"
    return 1
  fi

  return 0
}

function initGitVars() {

  export GIT_COMMENT=$(cd ${fibo_root} ; git log --format=%B -n 1 ${GIT_COMMIT})
  echo "GIT_COMMENT=${GIT_COMMENT}"

  export GIT_AUTHOR=$(cd ${fibo_root} ; git show -s --pretty=%an)
  echo "GIT_AUTHOR=${GIT_AUTHOR}"

  export GIT_BRANCH=$(cd ${fibo_root} ; git rev-parse --abbrev-ref HEAD)
  echo "GIT_BRANCH=${GIT_BRANCH}"

  branch_root="${product_root}/${GIT_BRANCH}"

  rm -rf "${branch_root}" >/dev/null 2>&1
  mkdir "${branch_root}"

  return 0
}

function initJiraVars() {

  export JIRA_ISSUE=$(echo $GIT_COMMENT | rev | grep -oP '\d+-[A-Z0-9]+(?!-?[a-zA-Z]{1,10})' | rev)
  echo JIRA_ISSUE=${JIRA_ISSUE}
}

function initStardogVars() {

  export STARDOG_HOME=/usr/local/stardog-home
  export STARDOG_BIN=/usr/local/stardog/bin

  stardog_vcs="${STARDOG_BIN}/stardog vcs"
}

function copyRdfToTarget() {

  echo "Copying all artifacts that we publish straight from git into target directory"

  (
    cd ${fibo_root}
    cp **/*.{rdf,ttl,md,jpg,png} --parents ${branch_root}/
  )

  (
    cd ${branch_root}
    for domain in * ; do
      [ -d ${domain} ] || continue
      [ "${domain}" == "etc" ] && continue
      [ "${domain}" == "ext" ] && continue
      upperDomain=$(echo ${domain} | tr '[:lower:]' '[:upper:]')
      [ "${domain}" == "${upperDomain}" ] && continue
      echo Domain is ${domain} should be ${upperDomain}
      mv ${domain} ${upperDomain}
    done
  )
}

function searchAndReplaceStuffInRdf() {

  echo "Replacing stuff in RDF files"

  local sedfile=$(mktemp ${tmp_dir}/sed.XXXXXX)
  
  cat > "${sedfile}" << __HERE__
#
# First replace all http:// urls to https:// if that's not already done
#
s@http://spec.edmcouncil.org@https://spec.edmcouncil.org@g
#
# Apparently there are some FND urls that are wrong in the git source:
#  - https://spec.edmcouncil.org/FND/ should be
#  - https://spec.edmcouncil.org/fibo/FND/
#
s@https://spec.edmcouncil.org/FND/@https://spec.edmcouncil.org/fibo/FND/@g
s@\(https://spec.edmcouncil.org/fibo/\)@\1ontology/${GIT_BRANCH}/@g
__HERE__

  cat "${sedfile}"

  (
    set -x
    find ${branch_root}/ -type f \( -name '*.rdf' -o -name '*.ttl' -o -name '*.md' \) -exec sed -i -f ${sedfile} {} \;
  )

  return 0
}

function convertMarkdownToHtml() {

  echo "Convert Markdown to HTML"

  (
    set -x
    cd "${branch_root}"
    find . -type f -name '*.md' -exec pandoc --standalone --from markdown --to html -o {}.html {} \;
  )

  return 0
}

function storeVersionInStardog() {

  echo "Commit to Stardog..."
  ${stardog_vcs} commit --add $(find ${branch_root} -name "*.rdf") -m "$GIT_COMMENT" -u obkhan -p stardogadmin ${GIT_BRANCH}
  SVERSION=$(${stardog_vcs} list --committer obkhan --limit 1 ${GIT_BRANCH} | sed -n -e 's/^.*Version:   //p')
  ${stardog_vcs} tag --drop $JIRA_ISSUE ${GIT_BRANCH} || true
  ${stardog_vcs} tag --create $JIRA_ISSUE --version $SVERSION ${GIT_BRANCH}
}

function convertRdfXmlTo() {

  local rdfFile="$1"
  local targetFormat="$2"
  local rdfFileNoExtension="${rdfFile/.rdf/}"
  local targetFile="${rdfFileNoExtension}"
  local rc=0

  echo "Converting ${rdfFile} to ${targetFormat}"

  (
    set -x
    java \
      -cp "${rdftoolkit_jar}" \
      "org.edmcouncil.rdf_toolkit.SesameRdfFormatter" \
      --source "${rdfFile}" \
      --source-format rdf-xml \
      --target "${targetFile}" \
      --target-format "${targetFormat}"
    rc=$?
    echo "rc=${rc}"
  )

  return ${rc}
}

#
# Now use the rdf-toolkit serializer to create copies of all .rdf files in all the supported RDF formats
#
# Using the Sesame serializer, here' the documentation:
#
# https://github.com/edmcouncil/rdf-toolkit/blob/master/docs/SesameRdfFormatter.md
#
function convertRdfXmlToAllFormats() {

  (
    cd fibo

    for rdfFile in **/*.rdf ; do
      for format in json-ld, n-triples, rdf-json, turtle ; do
        convertRdfXmlTo "${rdfFile}" "${format}" || return $?
      done || return $?
    done || return $?
  )

  return $?
}

function main() {

  initWorkspaceVars || return $?
  initGitVars || return $?
  initJiraVars || return $?
  #initStardogVars || return $?

  copyRdfToTarget || return $?
  #storeVersionInStardog || return $?
  searchAndReplaceStuffInRdf || return $?

  convertRdfXmlToAllFormats || return $?

  convertMarkdownToHtml || return $?
}

main $@
exit $?
