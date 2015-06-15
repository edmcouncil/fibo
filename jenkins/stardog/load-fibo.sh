#!/bin/bash
#
# Load the FIBO ontologies in the given clone of the Git repo (if run as a Jenkins job that's your current job workspace)
# into Stardog.
#

function initGlobals() {
	
  if [ "${WORKSPACE}" == "" ] ; then
    echo "ERROR: This script can only run in the context of a Jenkins job"
    return 1
  fi
  if [ ! -d ${WORKSPACE}/fibo ] ; then
    echo "ERROR: The fibo repo could not be found"
    return 1
  fi

  fibo_repo_root=${WORKSPACE}/fibo

  if ! cd ${fibo_repo_root} >/dev/null ; then
    echo "ERROR: Could not find FIBO repo root: ${fibo_repo_root}"
    return 1
  fi

  if ! which stardog >/dev/null ; then
    echo "ERROR: Stardog is not configured (or at least not on the PATH)"
    return 1
  fi

  stardog_bin=$(which stardog)
  stardog_admin_bin=$(which stardog-admin)

  echo "Using ${stardog_bin}"
  echo "Using ${stardog_admin_bin}"

  return 0
}

function loadIntoMainFiboDb() {
  #
  # By using the Jenkins BUILD_URL for the named graph into which we're loading
  # everything we can easily find the relationship between the Named Graph and
  # the job that created it.
  #
  fibo_test_named_graph=${BUILD_URL}

  set -x
  find . -type f -name '*.rdf' | xargs ${stardog_bin} data add fibo --named-graph ${fibo_test_named_graph}
}

function getDatabases() {
	
  stardog-admin db list --verbose | sed 's/[|+]/ /g' | grep -v "Databases" | grep -v "\-\-\-\-"
}

function getPreviousDatabasesCreatedByThisJob() {

  getDatabases | grep jenkins-${JOB_NAME}
}

function getPreviousDatabasesCreatedByThisJobExceptLast2() {

  local count=$(getPreviousDatabasesCreatedByThisJob | wc -l)
  if [ ${count} -gt 2 ] ; then
    getPreviousDatabasesCreatedByThisJob | head -n $((count - 2))
  else
    echo ""
  fi
}

function removePreviousDatabases() {

  for db in $(getPreviousDatabasesCreatedByThisJobExceptLast2) ; do
    echo "Deleting database ${db}"
    ${stardog_admin_bin} db drop --verbose -- ${db}
  done
}

function loadIntoTempJobDb() {

  echo "Creating temporary Stardog database ${BUILD_TAG}"

  set -x
  find . -type f -name '*.rdf' | xargs \
  ${stardog_admin_bin} db create \
    --index-triples-only \
    --name "${BUILD_TAG}" \
    --type M \
    --verbose \
    --options preserve.bnode.ids=false reasoning.type=SL icv.enabled=true icv.reasoning.enabled=true \
    --
  rc=$?
  set +x

  sleep 5

  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@ stardog.log @@@@@@@@@@@@@@@@@@@@@@@@@@@"
  tail -n 1000 /var/db/stardog/stardog.log	| sed -n '/Bulk loading data to new database '${BUILD_TAG}'/,$p'
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

  if [ ${rc} -eq 0 ] ; then
    echo Successfully created database http://stardog.edmcouncil.org/#/databases/${BUILD_TAG}
  fi

  return ${rc}
}

#
# Return all the .sq files in the FIBO repo
#
function getSparqlTestFiles() {

  find . -type f -name '*.sq'
}

#
# Execute the stardog command line "query execute" command, as documented here:
# http://docs.stardog.com/man/query-execute.html
#
function runSparqlTests() {
	
  #
  # We obviously need to change userid and password below
  #
  getSparqlTestFiles | xargs ${stardog_bin} query execute \
    --username admin \
    --password password \
    --reasoning \
    --verbose \
    "${BUILD_TAG}"
}

initGlobals || exit $?
removePreviousDatabases || exit $?
loadIntoTempJobDb || exit $?
runSparqlTests
