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

function initGitVars() {

  export GIT_COMMENT=$(git log --format=%B -n 1 ${GIT_COMMIT})
  echo GIT_COMMENT=${GIT_COMMENT}

  export GIT_AUTHOR=$(git show -s --pretty=%an)
  echo GIT_AUTHOR=${GIT_AUTHOR}

  if [ -z "${GIT_BRANCH}" ] ; then
    echo "ERROR: GIT_BRANCH undefined"
    return 1
  fi

  export GIT_BRANCH_SHORT="${GIT_BRANCH#*/}"
  echo GIT_BRANCH_SHORT="${GIT_BRANCH_SHORT}"
}

function initJiraVars() {

  export JIRA_ISSUE=$(echo $GIT_COMMENT | rev | grep -oP '\d+-[A-Z0-9]+(?!-?[a-zA-Z]{1,10})' | rev)
  echo JIRA_ISSUE=${JIRA_ISSUE}
}

function initStardogVars() {

  # Need access to stardog or - send this to another agent
  export STARDOG_HOME=/mount/stardog/current
  
  ""="${STARDOG_HOME}/bin/stardog vcs
}

function generateBuildProperties() {

  echo GIT_COMMENT=$GIT_COMMENT > build.properties
  echo GIT_AUTHOR=$GIT_AUTHOR >> build.properties
  echo JIRA_ISSUE=$JIRA_ISSUE >> build.properties
}

function main() {

  initGitVars || return $?
  initJiraVars || return $?
  initStardogVars || return $
  generateBuildProperties || return $?

  echo "Commit to Stardog..."
  ${stardog_vcs} commit --add $(find -name "*.rdf") -m "$GIT_COMMENT" -u obkhan -p stardogadmin ${GIT_BRANCH_SHORT}
  SVERSION=$(${stardog_vcs} list --committer obkhan --limit 1 ${GIT_BRANCH_SHORT} | sed -n -e 's/^.*Version:   //p')
  ${stardog_vcs} tag --drop $JIRA_ISSUE ${GIT_BRANCH_SHORT} || true
  ${stardog_vcs} tag --create $JIRA_ISSUE --version $SVERSION ${GIT_BRANCH_SHORT}
  tree -H . > index.html
}

main $@
exit $?
