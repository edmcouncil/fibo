#!/bin/bash

fiboroot="../../../../fibo"



cat > "echo.sq" <<EOF


CONSTRUCT {?s ?p ?o}
WHERE {?s ?p ?o }

EOF



#arq  $(find $fiboroot/be $fiboroot/bp $fiboroot/cae $fiboroot/civ $fiboroot/der $fiboroot/fbc $fiboroot/fnd $fiboroot/ind $fiboroot/loan $fiboroot/md $fiboroot/sec -name "*.rdf" | sed "s/^/--data=/") --data=AllProd.ttl --query=echo.sq --results=TTL> combined.ttl

# arq  $(grep -r 'utl-av[:;.]hasMaturity.*Release' "${fiboroot}" | grep -F ".rdf" |   sed 's/:.*$//' |  sed "s/^/--data=/") --data=AllProd.ttl --query=echo.sq --results=TTL> combined.ttl



arq  $(grep -r 'utl-av[:;.]hasMaturity.*\(Release\|Provisional\)' "${fiboroot}" | grep -F ".rdf" |   sed 's/:.*$//' |  sed "s/^/--data=/") --data=AllProd.ttl --query=echo.sq --results=TTL> combined.ttl

echo "finished combining"


cat >badlabels.sq <<EOF
PREFIX owl: <http://www.w3.org/2002/07/owl#>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>


CONSTRUCT {?s rdfs:label ?badlabel}
WHERE {?s ?p ?o .
FILTER NOT EXISTS {?s rdfs:label ?l}
FILTER (REGEX (xsd:string (?s), "edmcouncil"))
BIND (REPLACE (xsd:string (?s), "^.*/", "undefined label for ") AS ?badlabel)
}
EOF



arq --data=combined.ttl --query=badlabels.sq > badlabels.ttl

cat > subclass.sq <<EOF
PREFIX owl: <http://www.w3.org/2002/07/owl#>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
prefix dedm:   <http://www.edmcouncil.org/ddgraph#> 

CONSTRUCT {?child ?p ?parent.
   dedm:unionOf rdfs:label "union of";
      skos:definition "related parts to the union" .

?parent rdfs:label ?plabel . 
?child rdfs:label ?clabel .

?parent skos:definition ?pdef .
?child skos:definition ?cdef . 

}
WHERE {
{  {?child rdfs:subClassOf ?parent. FILTER (ISIRI (?parent))
    BIND (skos:broader AS ?p)} UNION
  {?child (owl:equivalentClass | rdfs:subClassOf)  / owl:unionOf / rdf:rest*/rdf:first ?parent .
    BIND (dedm:unionOf AS ?p)}  UNION 
  {?parent (owl:equivalentClass | rdfs:subClassOf)  / owl:unionOf / rdf:rest*/rdf:first ?child .
    BIND (skos:broader AS ?p)}  UNION 
  {?child (owl:equivalentClass | rdfs:subClassOf)  / owl:intersectionOf / rdf:rest*/rdf:first ?parent .
    BIND (skos:broader AS ?p)}  

}
   FILTER (REGEX (xsd:string (?parent), "edmcouncil"))
   FILTER (REGEX (xsd:string (?child), "edmcouncil"))

?parent rdfs:label ?plabel . 
?child rdfs:label ?clabel . 

OPTIONAL {?parent skos:definition ?pdef}
OPTIONAL {?child skos:definition ?cdef}

}
EOF

arq --data=combined.ttl  --query=subclass.sq > parent.ttl
arq --data=badlabels.ttl --data=combined.ttl --data=AllProd.ttl  --query=pseudorange1.sq > pr1.ttl


cat > subp.sq <<EOF
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix edm: <http://www.edmcouncil.org/temp#>


CONSTRUCT {?a edm:subPropertyOf ?b}
WHERE {?a rdfs:subPropertyOf ?b}
EOF

arq --data=combined.ttl  --query=subp.sq > subp.ttl



cat >maturity.sq <<EOF
PREFIX av: <https://spec.edmcouncil.org/fibo/FND/Utilities/AnnotationVocabulary/>
PREFIX afn: <http://jena.apache.org/ARQ/function#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 
prefix edm: <http://www.edmcouncil.org/ddgraph#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
prefix fibo-der-rtd-irswp: <https://spec.edmcouncil.org/fibo/DER/RateDerivatives/IRSwaps/> 


CONSTRUCT {?c av:hasMaturityLevel ?level }
WHERE {?c a owl:Class . 
FILTER (REGEX (xsd:string (?c), "edmcouncil"))
BIND (IRI(REPLACE (xsd:string (?c) , "/[^/]*$", "/")) as ?cstring)
?cstring av:hasMaturityLevel ?level . 
}
EOF

arq --data=combined.ttl  --query=maturity.sq > maturity.ttl



cat > filter.sq <<EOF
PREFIX afn: <http://jena.apache.org/ARQ/function#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 
prefix edm: <http://www.edmcouncil.org/temp#>
prefix dedm:   <http://www.edmcouncil.org/ddgraph#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX av: <https://spec.edmcouncil.org/fibo/FND/Utilities/AnnotationVocabulary/>


# This filters out redundant links, based on broader.  The
# subPropertyOf in this situation is linking the reified properties to
# their original counterparts.

# The basic query says, if a class is
# linked to two classes by the same (original) property, and one is
# strictly broader than the other, then you should suppress the less
# specific one.


CONSTRUCT {?s ?pa ?o}
WHERE {
    ?s ?pa ?o .
    FILTER NOT EXISTS {
       ?pa rdfs:subPropertyOf ?p . 
       ?pb (rdfs:subPropertyOf|edm:subPropertyOf)+ ?p . 
       ?s ?pb ?x .
       ?x skos:broader+ ?o
      }
    FILTER (?pa != edm:subPropertyOf)

    FILTER EXISTS {?s ?notm ?o .
                   FILTER (?notm != av:hasMaturityLevel)  }
}
EOF


arq  --data=maturity.ttl --data=pr1.ttl --data=parent.ttl      --data=subp.ttl --query=filter.sq > pr2.ttl
#arq  --data=pr1.ttl --data=parent.ttl      --data=subp.ttl --query=filter.sq > pr2.ttl



sed -i "s/@en//g" pr2.ttl


