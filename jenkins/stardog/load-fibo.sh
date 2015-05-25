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
	ls -all

	if ! which stardog >/dev/null ; then
	  echo "ERROR: Stardog is not configured (or at least not on the PATH)"
	  return 1
	fi

  stardog_bin=$(which stardog)
  stardog_admin_bin=$(which stardog-admin)

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

function loadIntoTempJobDb() {

  echo "Creating temporary Stardog database ${BUILD_TAG}"

  find . -type f -name '*.rdf' | xargs \
  ${stardog_admin_bin} db create \
  	--index-triples-only \ # We don't expect named graphs here
  	--name ${BUILD_TAG} \
  	--type M \ # It's all temporary so just make it a memory database
  	--options "bnode.preserve.ids=false reasoning.type=RDFS"
  	--verbose \
  	--
}

initGlobals || exit $?
loadIntoTempJobDb
