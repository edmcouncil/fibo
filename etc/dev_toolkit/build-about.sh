#!/bin/bash
#
# Create an about file in RDF/XML format, do this BEFORE we convert all .rdf files to the other
# formats so that this about file will also be converted.
#
# TODO: Generate this at each directory level in the tree
#  I don't think this is correct; the About files at lower levels have curated metadata in them.  -DA
#
# DONE: Should be done for each serialization format
#
function ontologyCreateAboutFiles () {

  local tmpAboutFileDev="$(mktemp ${tmp_dir}/ABOUTD.XXXXXX.ttl)"
  local tmpAboutFileProd="$(mktemp ${tmp_dir}/ABOUTP.XXXXXX.ttl)"
  local echoq="$(mktemp ${tmp_dir}/echo.sparqlXXXXXX)"

  (
    cd ${tag_root}

    cat > "${tmpAboutFileProd}" << __HERE__
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
@prefix owl: <http://www.w3.org/2002/07/owl#> 
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>
<${tag_root_url}/AboutFIBO> a owl:Ontology;
__HERE__



    grep \
	-r 'utl-av[:;.]Release' . | \
	grep -F ".rdf" | \
	sed 's/:.*$//'  | \
	while read file; do
	    grep "xml:base" "${file}";
        done | \
	sed 's/^.*xml:base="/owl:imports </;s/"[\t \n\r]*$/> ;/' \
	    >> "${tmpAboutFileProd}"

    cat > "${echoq}" << __HERE__
CONSTRUCT {?s ?p ?o} WHERE {?s ?p ?o}
__HERE__

    "${jena_arq}" --data="${tmpAboutFileProd}" --query="${echoq}" --results=RDF > AboutFIBOProd.rdf 2>${tmp_dir}/err.tmp

   if [ -s ${tmp_dir}/err.tmp ]
     then echo "no RDF XML output generated.  Use AboutFIBOProd.ttl file instead"
   fi

  )

  (
    cd ${tag_root}

    cat > "${tmpAboutFileDev}" << __HERE__
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
@prefix owl: <http://www.w3.org/2002/07/owl#> 
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>
<${tag_root_url}/AboutFIBO> a owl:Ontology;
__HERE__

    grep \
      -r "xml:base" \
      $( \
        find . -mindepth 1  -maxdepth 1 -type d -print | \
        grep -vE "(etc)|(git)"
      ) | \
      grep -vE "(catalog)|(About)|(About)" | \
	  sed 's/^.*xml:base="/owl:imports </;s/"[ 	\n\r]*$/> ;/' \
      >> "${tmpAboutFileDev}"

    cat > "${echoq}" << __HERE__
CONSTRUCT {?s ?p ?o} WHERE {?s ?p ?o}
__HERE__

    "${jena_arq}" --data="${tmpAboutFileDev}" --query="${echoq}" --results=RDF > AboutFIBODev.rdf 2>${tmp_dir}/err.tmp

    if [ -s ${tmp_dir}/err.tmp ]
     then echo "no RDF XML output generated.  Use AboutFIBODev.ttl file instead"
   fi

  )

  return 0

}
