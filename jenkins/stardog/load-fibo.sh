#!/bin/bash
#
# Load the FIBO ontologies in the given clone of the Git repo (if run as a Jenkins job that's your current job workspace)
# into Stardog.
#

if [ "${WORKSPACE}" == "" ] ; then
  fibo_repo_root=~/git/fibo
else
	fibo_repo_root=${WORKSPACE}/fibo
fi
if ! cd ${fibo_repo_root} >/dev/null ; then
	echo "ERROR: Could not find FIBO repo root: ${fibo_repo_root}"
	exit 1
fi
ls -all

if ! which stardog >/dev/null ; then
  echo "ERROR: Stardog is not configured (or at least not on the PATH)"
  exit 1
fi

stardog_bin=$(which stardog)

#
# By using the Jenkins BUILD_URL for the named graph into which we're loading
# everything we can easily find the relationship between the Named Graph and
# the job that created it.
#
fibo_test_named_graph=${BUILD_URL}

set -x
find . -type f -name '*.rdf' | xargs ${stardog_bin} data add fibo --named-graph ${fibo_test_named_graph}



