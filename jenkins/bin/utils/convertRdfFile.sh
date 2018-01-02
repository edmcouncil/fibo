#!/usr/bin/env bash

#
# Invoke the rdf-toolkit to convert an RDF file to another format
#
function convertRdfFileTo() {

  local sourceFormat="$1"
  local rdfFile="$2"
  local targetFormat="$3"
  local rdfFileNoExtension="${rdfFile/.rdf/}"
  local rdfFileNoExtension="${rdfFileNoExtension/.ttl/}"
  local rdfFileNoExtension="${rdfFileNoExtension/.jsonld/}"
  local targetFile="${rdfFileNoExtension}"
  local rc=0
  local logfile=$(mktemp ${tmp_dir}/convertRdfFileTo.XXXXXX)

  case ${targetFormat} in
    rdf-xml)
      targetFile="${targetFile}.rdf"
      ;;
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
    -Xmx4G \
    -Xms4G \
    -Dfile.encoding=UTF-8 \
    -jar "${rdftoolkit_jar}" \
    --source "${rdfFile}" \
    --source-format "${sourceFormat}" \
    --target "${targetFile}" \
    --target-format "${targetFormat}" \
    --inline-blank-nodes \
    --infer-base-iri \
    --use-dtd-subset \
    > "${logfile}"    # 2>&1
  rc=$?

  #
  # For the turtle files, we want the base annotations to be the versionIRI
  #
  if [ "${targetFormat}" == "turtle" ] ; then
    echo "Adjusting ttl base URI for ${rdfFile/${WORKSPACE}/}"
    sed -i "s?^\(\(# baseURI:\)\|\(@base\)\).*ontology/?&${GIT_BRANCH}/${GIT_TAG_NAME}/?" "${targetFile}"
    sed -i "s@${GIT_BRANCH}/${GIT_TAG_NAME}/${GIT_BRANCH}/${GIT_TAG_NAME}/@${GIT_BRANCH}/${GIT_TAG_NAME}/@" \
	  "${targetFile}"
  fi

  if grep -q "ERROR" "${logfile}"; then
    echo "Found errors during conversion of ${rdfFile/${WORKSPACE}/} to \"${targetFormat}\":"
    cat "${logfile}"
    rm "${logfile}"
    return 1
  fi
  rm "${logfile}"
  #echo "Conversion of ${rdfFile/${WORKSPACE}/} to \"${targetFormat}\" was successful"

  return ${rc}
}

function main() {

  convertRdfFileTo $*
}

main $*
exit $?
