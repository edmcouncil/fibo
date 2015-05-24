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
if [ ! -d "${fibo_repo_root}" ] ; then
	echo "ERROR: Could not find FIBO repo root: ${fibo_repo_root}"
	exit 1
fi

if ! which stardog >/dev/null ; then
  echo "ERROR: Stardog is not configured (or at least not on the PATH)"
  exit 1
fi

stardog_bin=$(which stardog)

fibo_test_named_graph=${BUILD_TAG}

cd ${fibo_repo_root}

set -x
find . -type f -name '*.rdf' | xargs ${stardog_bin} data add fibo --named-graph ${fibo_test_named_graph}



