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
fibo_root=""
fibo_infra_root=""

spec_root="${WORKSPACE}/target"
family_root="${spec_root}/fibo"
product_root="${family_root}/ontology"
branch_root=""

stardog_vcs=""

shopt -s globstar

function initWorkspaceVars() {

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

  cp -v --parents ${fibo_root}/**/*.{rdf,ttl,md} ${branch_root}/
}

function replaceBaseIri() {

  find \
    ${branch_root}/ \
    -exec sed -i '' \
    's@http://spec.edmcouncil.org/fibo/@https://spec.edmcouncil.org/fibo/ontology/${GIT_BRANCH}/@g' \
    {} \;

  return 0
}

function storeVersionInStardog() {

  echo "Commit to Stardog..."
  ${stardog_vcs} commit --add $(find ${branch_root} -name "*.rdf") -m "$GIT_COMMENT" -u obkhan -p stardogadmin ${GIT_BRANCH}
  SVERSION=$(${stardog_vcs} list --committer obkhan --limit 1 ${GIT_BRANCH} | sed -n -e 's/^.*Version:   //p')
  ${stardog_vcs} tag --drop $JIRA_ISSUE ${GIT_BRANCH} || true
  ${stardog_vcs} tag --create $JIRA_ISSUE --version $SVERSION ${GIT_BRANCH}
}

function generateSpecIndex() {

  tree -H ${spec_root} > ${spec_root}/index.html
}

function main() {

  initWorkspaceVars || return $?
  initGitVars || return $?
  initJiraVars || return $?
  initStardogVars || return $?

  copyRdfToTarget || return $?
  #storeVersionInStardog || return $?
  replaceBaseIri || return $?
  generateSpecIndex || return $?
}

main $@
exit $?
