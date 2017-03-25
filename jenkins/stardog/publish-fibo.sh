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
stardog_vcs=""

function initWorkspaceVars() {

  fibo_root="${WORKSPACE}/fibo"
  echo fibo_root=${fibo_root}

  if [ ! -d "${fibo_root}"] ; then
    echo "ERROR: fibo_root directory not found (${fibo_root})"
    return 1
  fi

  export fibo_infra_root="${WORKSPACE}/fibo-infra"
  echo fibo_infra_root=${fibo_infra_root}

  if [ ! -d "${fibo_infra_root}"] ; then
    echo "ERROR: fibo_infra_root directory not found (${fibo_infra_root})"
    return 1
  fi

  return 0
}

function initGitVars() {

  export GIT_COMMENT=$(cd ${fibo_root} ; git log --format=%B -n 1 ${GIT_COMMIT})
  echo GIT_COMMENT=${GIT_COMMENT}

  export GIT_AUTHOR=$(cd ${fibo_root} ; git show -s --pretty=%an)
  echo GIT_AUTHOR=${GIT_AUTHOR}

  export GIT_BRANCH=$(cd ${fibo_root} ; git rev-parse --abbrev-ref HEAD)
  echo GIT_BRANCH=${GIT_BRANCH}
}

function initJiraVars() {

  export JIRA_ISSUE=$(echo $GIT_COMMENT | rev | grep -oP '\d+-[A-Z0-9]+(?!-?[a-zA-Z]{1,10})' | rev)
  echo JIRA_ISSUE=${JIRA_ISSUE}
}

function initStardogVars() {

  # Need access to stardog or - send this to another agent
  export STARDOG_HOME=/mount/stardog/current
  
  stardog_vcs="${STARDOG_HOME}/bin/stardog vcs"
}

function generateBuildProperties() {

  echo GIT_COMMENT=$GIT_COMMENT > build.properties
  echo GIT_AUTHOR=$GIT_AUTHOR >> build.properties
  echo JIRA_ISSUE=$JIRA_ISSUE >> build.properties
}

function main() {

  initWorkspaceVars || return $?
  initGitVars || return $?
  initJiraVars || return $?
  initStardogVars || return $
  generateBuildProperties || return $?

  echo "Commit to Stardog..."
  ${stardog_vcs} commit --add $(find ${fibo_root} -name "*.rdf") -m "$GIT_COMMENT" -u obkhan -p stardogadmin ${GIT_BRANCH}
  SVERSION=$(${stardog_vcs} list --committer obkhan --limit 1 ${GIT_BRANCH} | sed -n -e 's/^.*Version:   //p')
  ${stardog_vcs} tag --drop $JIRA_ISSUE ${GIT_BRANCH} || true
  ${stardog_vcs} tag --create $JIRA_ISSUE --version $SVERSION ${GIT_BRANCH}
  tree -H . > index.html
}

main $@
exit $?
