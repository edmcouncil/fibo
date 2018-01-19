#!/bin/bash

fiboroot="../../../../fibo"



cat > "echo.sq" <<EOF


CONSTRUCT {?s ?p ?o}
WHERE {?s ?p ?o }

EOF



#arq  $(find $fiboroot/be $fiboroot/bp $fiboroot/cae $fiboroot/civ $fiboroot/der $fiboroot/fbc $fiboroot/fnd $fiboroot/ind $fiboroot/loan $fiboroot/md $fiboroot/sec -name "*.rdf" | sed "s/^/--data=/") --data=AllProd.ttl --query=echo.sq --results=TTL> combined.ttl

arq  $(grep -r 'utl-av[:;.]hasMaturity.*Release' "${fiboroot}" | grep -F ".rdf" |   sed 's/:.*$//' |  sed "s/^/--data=/") --data=AllProd.ttl --query=echo.sq --results=TTL> combined.ttl

echo "finished combining"




# arq --data=combined.ttl --query=pseudorange.sq > pr.ttl

cat > subclass.sq <<EOF
PREFIX owl: <http://www.w3.org/2002/07/owl#>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
prefix dedm:   <http://www.edmcouncil.org/ddgraph#> 

CONSTRUCT {?child ?p ?parent}
WHERE {
{  {?child rdfs:subClassOf ?parent. FILTER (ISIRI (?parent))
    BIND (skos:broader AS ?p)} UNION
  {?child (owl:equivalentClass | rdfs:subClassOf)  / owl:unionOf / rdf:rest*/rdf:first ?parent .
    BIND (dedm:unionOf AS ?p)}  UNION 
  {?parent (owl:equivalentClass | rdfs:subClassOf)  / owl:unionOf / rdf:rest*/rdf:first ?child .
    BIND (skos:broader AS ?p)}
}
   FILTER (REGEX (xsd:string (?parent), "edmcouncil"))
   FILTER (REGEX (xsd:string (?child), "edmcouncil"))
}
EOF

arq --data=combined.ttl  --query=subclass.sq > parent.ttl
arq --data=combined.ttl --data=AllProd.ttl  --query=pseudorange1.sq > pr1.ttl


cat > subp.sq <<EOF
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix edm: <http://www.edmcouncil.org/temp#>


CONSTRUCT {?a edm:subPropertyOf ?b}
WHERE {?a rdfs:subPropertyOf ?b}
EOF

arq --data=combined.ttl  --query=subp.sq > subp.ttl

cat > filter.sq <<EOF
PREFIX afn: <http://jena.apache.org/ARQ/function#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 
prefix edm: <http://www.edmcouncil.org/temp#>
prefix dedm:   <http://www.edmcouncil.org/ddgraph#> 
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

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
}
EOF


arq --data=pr1.ttl --data=parent.ttl --data=subp.ttl --query=filter.sq > pr2.ttl

sed -i "s/@en//g" pr2.ttl


