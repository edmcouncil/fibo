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

echo "This is the version for INFRA-143"

tmp_dir="${WORKSPACE}/tmp"
fibo_root=""
fibo_infra_root=""
jena_arq=""

spec_root="${WORKSPACE}/target"
family_root="${spec_root}/fibo"
product_root="${family_root}/ontology"
branch_root=""
tag_root=""

spec_root_url="https://spec.edmcouncil.org"
family_root_url="${spec_root_url}/fibo"
product_root_url="${family_root_url}/ontology"
branch_root_url=""
tag_root_url=""

stardog_vcs=""

rdftoolkit_jar="${WORKSPACE}/rdf-toolkit.jar"

shopt -s globstar

trap "rm -rf ${tmp_dir} >/dev/null 2>&1" EXIT

#
# This is for tools like pandoc
#
. /home/ec2-user/.nix-profile/etc/profile.d/nix.sh

function initWorkspaceVars() {

  #tmp_dir=$(mktemp -d "${tmp_dir:-/tmp}/$(basename 0).XXXXXXXXXXXX")
  mkdir -p "${tmp_dir}" >/dev/null 2>&1
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

  jena_arq="${fibo_infra_root}/bin/apache-jena-3.0.1/bin/arq"

  if [ ! -f "${jena_arq}" ] ; then
    echo "ERROR: ${jena_arq} not found"
    return 1
  fi

  chmod a+x "${jena_arq}"

  return 0
}

function initGitVars() {

  export GIT_COMMENT=$(cd ${fibo_root} ; git log --format=%B -n 1 ${GIT_COMMIT})
  echo "GIT_COMMENT=${GIT_COMMENT}"

  export GIT_AUTHOR=$(cd ${fibo_root} ; git show -s --pretty=%an)
  echo "GIT_AUTHOR=${GIT_AUTHOR}"

  #
  # Get the git branch name to be used as directory names and URL fragments and make it
  # all lower case
  #
  export GIT_BRANCH=$(cd ${fibo_root} ; git rev-parse --abbrev-ref HEAD | tr '[:upper:]' '[:lower:]')
  echo "GIT_BRANCH=${GIT_BRANCH}"

  branch_root="${product_root}/${GIT_BRANCH}"
  branch_root_url="${product_root_url}/${GIT_BRANCH}"

  rm -rf "${branch_root}" >/dev/null 2>&1
  mkdir -p "${branch_root}" >/dev/null 2>&1

  #
  # If the current commit has a tag associated to it then the Git Tag Message Plugin in Jenkins will
  # initialize the GIT_TAG_NAME variable with that tag. Otherwise set it to "latest"
  #
  # See https://wiki.jenkins-ci.org/display/JENKINS/Git+Tag+Message+Plugin
  #
  export GIT_TAG_NAME="${GIT_TAG_NAME:-latest}"
  echo "GIT_TAG_NAME=${GIT_TAG_NAME}"

  tag_root="${branch_root}/${GIT_TAG_NAME}"
  tag_root_url="${branch_root_url}/${GIT_TAG_NAME}"

  mkdir -p "${tag_root}" >/dev/null 2>&1

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

#
# Create an about file.
#
# TODO: Generate this at each directory level in the tree
#
# TODO: Should be done for each serialization format
#
function createAboutFile () {

  local aboutfile=$(mktemp ${tmp_dir}/ABOUT.XXXXXX.ttl)
  local echoq=$(mktemp ${tmp_dir}/echo.sqXXXXXX)

  (
    cd ${tag_root}

    cat > "${aboutfile}" << __HERE__
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
@prefix owl: <http://www.w3.org/2002/07/owl#> 
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>
<${tag_root_url}/AboutFIBO> a owl:Ontology;
__HERE__

    grep \
      -r "xml:base" \
      $( \
        find . -mindepth 1  -maxdepth 1 -type d -print | \
        grep -vE "(etc)|(git)"
      ) | \
      grep -v catalog | \
      sed 's/^.*xml:base="/owl:imports </;s/" *$/> ;/' \
      >> "${aboutfile}"

    cat > "${echoq}" << __HERE__
CONSTRUCT {?s ?p ?o} WHERE {?s ?p ?o}
__HERE__

    "${jena_arq}" --data="${aboutfile}" --query="${echoq}" --results=RDF > AboutFIBO.rdf
  )
}

function copyRdfToTarget() {

  echo "Copying all artifacts that we publish straight from git into target directory"

  (
    cd ${fibo_root}
    cp **/*.{rdf,ttl,md,jpg,png,docx,pdf,sq} --parents ${tag_root}/
  )

  (
    cd ${tag_root}
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

  #
  # Clean up a few things
  #
  rm ${tag_root}/etc/cm >/dev/null 2>&1
  rm ${tag_root}/etc/source   >/dev/null 2>&1
  rm ${tag_root}/etc/infra >/dev/null 2>&1
  rm -vrf ${tag_root}/**/archive >/dev/null 2>&1
}

function searchAndReplaceStuffInRdf() {

  echo "Replacing stuff in RDF files"

  local sedfile=$(mktemp ${tmp_dir}/sed.XXXXXX)
  
  cat > "${sedfile}" << __HERE__
#
# First replace all http:// urls to https:// if that's not already done
#
s@http://spec.edmcouncil.org@${spec_root_url}@g
#
# Apparently there are some FND urls that are wrong in the git source:
#  - https://spec.edmcouncil.org/FND/ should be
#  - https://spec.edmcouncil.org/fibo/FND/
#
s@https://spec.edmcouncil.org/FND/@${family_root_url}/FND/@g
s@\(https://spec.edmcouncil.org/fibo/\)@\1ontology/${GIT_BRANCH}/@g
__HERE__

  cat "${sedfile}"

  (
    set -x
    find ${tag_root}/ -type f \( -name '*.rdf' -o -name '*.ttl' -o -name '*.md' \) -exec sed -i -f ${sedfile} {} \;
  )

  return 0
}

function convertMarkdownToHtml() {

  echo "Convert Markdown to HTML"

  (
    cd "${tag_root}"
    for markdownFile in **/*.md ; do
      echo "Convert ${markdownFile} to html"
      pandoc --standalone --from markdown --to html -o "${markdownFile/.md/.html}" "${markdownFile}"
    done
  )

  return 0
}

#
# TODO: Omar can you look at this? Do we still need this?
#
function storeVersionInStardog() {

  echo "Commit to Stardog..."
  ${stardog_vcs} commit --add $(find ${tag_root} -name "*.rdf") -m "$GIT_COMMENT" -u obkhan -p stardogadmin ${GIT_BRANCH}
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
  local logfile=$(mktemp ${tmp_dir}/convertRdfXmlTo.XXXXXX)

  case ${targetFormat} in
    json-ld)
      targetFile="${targetFile}.jsonld"
      ;;
    turtle)
      targetFile="${targetFile}.ttl"
      ;;
    *)
      echo "ERROR: Unsupported format ${targetFormat}"
      return 1
      ;;
  esac

  java \
    -jar "${rdftoolkit_jar}" \
    --source "${rdfFile}" \
    --source-format rdf-xml \
    --target "${targetFile}" \
    --target-format ${targetFormat} \
    > "${logfile}" 2>&1
  rc=$?

  if grep -q "ERROR" "${logfile}"; then
    echo "Found errors during conversion of ${rdfFile} to \"${targetFormat}\":"
    cat "${logfile}"
    rm "${logfile}"
    return 1
  fi
  rm "${logfile}"
  echo "Conversion of ${rdfFile} to \"${targetFormat}\" was successful"

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
    cd "${tag_root}"

    for rdfFile in **/*.rdf ; do
      for format in json-ld turtle ; do
        convertRdfXmlTo "${rdfFile}" "${format}" || return $?
      done || return $?
    done || return $?
  )

  return $?
}

#
# We need to put the output of this job in a directory next to all other branches and never delete any of the
# other formerly published branches.
#
function zipWholeTagDir() {

  local tarGzFile="${branch_root}/${GIT_TAG_NAME}.tar.gz"

  tar -cvzf "${tarGzFile}" "${tag_root}"

  echo "Created ${tarGzFile}:"
  ls -al "${tarGzFile}" || return $?

  return 0
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

  createAboutFile || return $?

  convertMarkdownToHtml || return $?

  zipWholeTagDir
}

main $@
exit $?
