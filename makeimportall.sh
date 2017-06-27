cat >all.ttl <<EOF
# baseURI: https://spec.edmcounci.org/FIBO
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
@prefix owl: <http://www.w3.org/2002/07/owl#> 
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> 
<https://spec.edmcounci.org/FIBO> a owl:Ontology . 
EOF

grep -r "xml:base" bp der fnd ind ext md sec be cae civ fbc loan uo | grep -v catalog | grep -v About | sed 's/^.*xml:base="/owl:imports </;s/">*.*$/> ./' | sed 's@^@<https://spec.edmcounci.org/FIBO> @' >> all.ttl







