#!/bin/bash

# we assume that ITEM_ROOTDIR is set to the fibo-infra directory
# on jenkins, this will be checked out and present in that directory
cd  ${ITEM_ROOTDIR}
pwd
cd  local/pellet-2.3.1/

# run pellet with all other parameters passed in.
./pellet.sh $*


