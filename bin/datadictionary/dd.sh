#!/bin/bash

if [ "$1" = "yes" ] ;
then

cat > "echo.sq" <<EOF


CONSTRUCT {?s ?p ?o}
WHERE {?s ?p ?o }

EOF


arq  $(find AllDev.ttl be bp cae civ der fbc fnd ind loan md sec -name "*.rdf" | sed "s/^/--data=/") --query=echo.sq --results=TTL> combined.ttl

echo "finished combining"


arq --data=combined.ttl --query=pseudorange.sq > pr.ttl

fi

echo "finished pseudorange"

echo "" > output.tsv

echo "" > DONE

function localdd () {

if grep -q "$1" DONE ;
then
     echo "I've seen it before!"
else
echo "$1" >> DONE
    
cat > "temp.sq" << EOF

PREFIX afn: <http://jena.apache.org/ARQ/function#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 
prefix edm: <http://www.edmcouncil.org/temp#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX av: <https://spec.edmcouncil.org/fibo/FND/Utilities/AnnotationVocabulary/>

SELECT DISTINCT ?table ?definition ?field ?description ?type
WHERE {
BIND ($1 AS ?class)
?class rdfs:subClassOf* ?base1 .
?b1 a edm:PR ; edm:p ?p ; edm:pseudorange ?r1 ; edm:pseudodomain ?base1 .
?p av:forDD "true"^^xsd:boolean .
FILTER NOT EXISTS {?class rdfs:subClassOf* ?base2 .
#                   FILTER (?base2 != ?base1)
                   ?b2 a edm:PR ; edm:p ?p ; edm:pseudorange ?r2 ; edm:pseudodomain ?base2 .
		   ?r2 rdfs:subClassOf+ ?r1 }

#BIND (afn:localname(?p)  AS ?field)
#BIND (afn:localname(?r1)  AS ?type)
#BIND (afn:localname(?class) AS  ?table)

?p rdfs:label ?field .
OPTIONAL {?p  skos:definition ?dx}
LET (?description := COALESCE (?dx, "(none)"))
?r1 rdfs:label ?type .
?class rdfs:label ?table
OPTIONAL {?class skos:definition  ?dy }
LET (?definition := COALESCE (?dy, "(none)"))

} ORDER BY ?field


EOF



arq --data=combined.ttl --data=pr.ttl --data=AllDev.ttl --query=temp.sq --results=TSV > output1.tsv
cat output1.tsv | tail +2 | sed "2,\$s/^[^\t]*\t[^\t]*\t/\t\"\"\t/" | sed "s/\"@../\"/g" >> output.tsv

echo "Finished tsv for $1"

cat > "temp.sq" << EOF

PREFIX afn: <http://jena.apache.org/ARQ/function#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
prefix skos: <http://www.w3.org/2004/02/skos/core#> 
prefix edm: <http://www.edmcouncil.org/temp#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX av: <https://spec.edmcouncil.org/fibo/FND/Utilities/AnnotationVocabulary/>

SELECT DISTINCT ?r1
WHERE {
BIND ($1 AS ?class)
?class rdfs:subClassOf* ?base1 .
?b1 a edm:PR ; edm:p ?p ; edm:pseudorange ?r1 ; edm:pseudodomain ?base1 .
?p av:forDD "true"^^xsd:boolean . 
FILTER NOT EXISTS {?class rdfs:subClassOf* ?base2 .
#                   FILTER (?base2 != ?base1)
                   ?b2 a edm:PR ; edm:p ?p ; edm:pseudorange ?r2 ; edm:pseudodomain ?base2 .
		   ?r2 rdfs:subClassOf+ ?r1 }

BIND (afn:localname(?p)  AS ?field)

} ORDER BY ?field


EOF


arq --data=combined.ttl --data=pr.ttl --data=AllDev.ttl --query=temp.sq --results=CSV > next

echo "Finished next for $1"

tail -n +2 next |  while read uri ; do
  localdd "<$(echo "${uri}" | sed 's/\r//')>" 
done


fi
}


# https://spec.edmcouncil.org/fibo/DER/RateDerivatives/IRSwaps/InterestRateSwap
# <https://spec.edmcouncil.org/fibo/BE/LegalEntities/LegalPersons/LegalPerson>" 

localdd "<https://spec.edmcouncil.org/fibo/FND/AgentsAndPeople/People/Person>" 

cat > output.csv <<EOF
Table,Definition,Field,Field Definition,Type
EOF

sed 's/"\t"/","/g; s/^\t"/,"/' output.tsv > output.csv


