arq --data=../../fibo/fbc/FunctionalEntities/RegulatoryAgencies.rdf --data=../jenkins/bin/glossary/owlnames.ttl --data=../jenkins/bin/fibo-vocabulary/datatypes.rdf --query=../jenkins/bin/fibo-vocabulary/skosecho.sparql --results=TTL > temp0.ttl

echo "finished combining"
 
java -cp "../bin/apache-jena-2.11.0/lib/*;.;SPIN/spin-1.3.3.jar" org.topbraid.spin.tools.RunInferences http://example.org/example temp0.ttl > temp1.ttl

echo "finished spin"

  java \
    -Xmx2G \
    -Xms2G \
    -jar "C:/Users/Dean/Documents/fibo/.git/hooks/rdf-toolkit.jar" \
    --source temp1.ttl \
    --source-format turtle \
    --target temp2.json \
    --target-format json-ld \
    --infer-base-iri \
    --use-dtd-subset -ibn \
    > log 2>&1


echo "finished json"
