#!/bin/bash
#
# Stuff for building catalog files
#

function build1catalog () {

  (
    cd "$1"     # Build the catalog in this directory
    echo "building catalog in $1"
    local fibo_rel="${2}"
    cat  > catalog-v001.xml <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<catalog prefer="public" xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
EOF

    #
    # Find all the rdf files in fibo, and create catalog lines for them based on their location.
    #
    pwd
    echo "${fibo_rel}"
    find $fibo_rel  -name '*.rdf' | \
      grep -v etc | \
      sed 's@^.*$@  <uri id="User Entered Import Resolution" uri="&" name="https://spec.edmcouncil.org/fibo/&"/>@;s@.rdf"/>@/"/>@' | \
      sed "s@fibo/${fibo_rel}/\([a-zA-Z]*/\)@fibo/${product}/${GIT_BRANCH}/${GIT_TAG_NAME}/\U\1\E@" | \
      sed "s@fibo//*@fibo/@g" >> catalog-v001.xml

    cat  >> catalog-v001.xml <<EOF 
<!-- Automatically built by EDMC infrastructure -->
</catalog>
EOF
  )
}

function ontologyBuildCats () {

  echo "Step: ontologyBuildCats"

  #
  # Run build1catalog in each subdirectory except ext, etc and .git
  #
  find ${tag_root} \
    -maxdepth 1 \
    -mindepth 1 \
    -type d \( \
      -regex "\(.*/ext\)\|\(.*/etc\)\|\(.*/.git\)$" -prune  -o -print \
    \) | while read file ; do
      build1catalog "$file" ".."
    done

  #
  # Run build1catalog in the main directory
  #
  build1catalog "${tag_root}" "."

  return $?
}


