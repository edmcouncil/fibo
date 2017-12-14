#!/bin/bash

fiboroot="../../../../fibo"


if [ "$1" = "yes" ] ;
then

cat > "echo.sq" <<EOF


CONSTRUCT {?s ?p ?o}
WHERE {?s ?p ?o }

EOF



arq  $(find $fiboroot/be $fiboroot/bp $fiboroot/cae $fiboroot/civ $fiboroot/der $fiboroot/fbc $fiboroot/fnd $fiboroot/ind $fiboroot/loan $fiboroot/md $fiboroot/sec -name "*.rdf" | sed "s/^/--data=/") --data=AllProd.ttl --query=echo.sq --results=TTL> combined.ttl

echo "finished combining"




arq --data=combined.ttl --query=pseudorange.sq > pr.ttl


cat > "con1.sq" <<EOF
PREFIX av: <https://spec.edmcouncil.org/fibo/FND/Utilities/AnnotationVocabulary/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 

SELECT DISTINCT ?c
WHERE {?x av:forCM true . 
?x rdfs:subClassOf* ?c  .
FILTER (ISIRI (?c))
}

EOF



arq --data=combined.ttl --query=con1.sq --results=TSV > CONCEPTS

#arq --data=combined.ttl --data=AllProd.ttl --query=pseudorange1.sq > pr1.ttl
#sed -i "s/@en//g" pr1.ttl

fi

echo "finished pseudorange"

echo "" > output.tsv

cp CONCEPTS DONE

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


?p rdfs:label ?field .
OPTIONAL {?p  skos:definition ?dx}
LET (?description := COALESCE (?dx, "(none)"))
?r1 rdfs:label ?type .
?class rdfs:label ?table
OPTIONAL {?class skos:definition  ?dy }
LET (?definition := COALESCE (?dy, "(none)"))

} ORDER BY ?field


EOF



arq --data=combined.ttl --data=pr.ttl --data=AllProd.ttl --query=temp.sq --results=TSV > output1.tsv
cat output1.tsv | tail -n +2 | sed "2,\$s/^[^\t]*\t[^\t]*\t/\t\"\"\t/" | sed "s/\"@../\"/g" >> output.tsv

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
FILTER (ISIRI (?r1))
?p av:forDD "true"^^xsd:boolean . 
FILTER NOT EXISTS {?class rdfs:subClassOf* ?base2 .
#                   FILTER (?base2 != ?base1)
                   ?b2 a edm:PR ; edm:p ?p ; edm:pseudorange ?r2 ; edm:pseudodomain ?base2 .
		   ?r2 rdfs:subClassOf+ ?r1 }


} 


EOF


arq --data=combined.ttl --data=pr.ttl --data=AllProd.ttl --query=temp.sq --results=CSV > next

echo "Finished next for $1"


tail -n +2  next |  while read uri ; do
  localdd "<$(echo "${uri}" | sed 's/\r//')>" 
done


fi
}


function dumpdd () {

echo "$1"
t=${1##*/}
fname=${t%>*}
echo $fname
rm -f $fname.*

echo "" > output.tsv

cp CONCEPTS DONE

localdd $1


cat > $fname.csv <<EOF
Table,Definition,Field,Field Definition,Type
EOF

sed 's/"\t"/","/g; s/^\t"/,"/' output.tsv > $fname.csv


cat > $fname.xls <<EOF
<table border=1>
<tr><th  bgcolor="goldenrod">Table</th><th  bgcolor="goldenrod">Definition</th><th  bgcolor="goldenrod">Field</th><th  bgcolor="goldenrod">Field Definition</th><th  bgcolor="goldenrod">Type</th></tr>
EOF
tail -n +2 output.tsv | sed 's!"\t"!</td><td valign="top">!g; s!^"!<td valign="top">!; s!^\t"!<td/><td valign="top">!; s!"$!</td>!g; s!^!<tr>!; s!$!</tr>!'  >> $fname.xls
cat >>$fname.xls <<EOF
</table>
EOF
sed -i '4,${s/<td/<td bgcolor="azure"/g;n}' $fname.xls
}




cat > "dumps.sq" <<EOF

prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
SELECT ?c
WHERE {
?x <https://spec.edmcouncil.org/fibo/FND/Utilities/AnnotationVocabulary/dumpable> true .
?c rdfs:subClassOf* ?x . 
}

EOF

arq --data=combined.ttl --query=dumps.sq  --results=TSV> dumps


tail -n +2 dumps | while read class ; do
    dumpdd $class
done
