# Turns FIBO in to FIBO-V
# 
# The translation proceeds with the following steps:
# 
# 1) Start the output with the standard prefixes.  They are in a file called skosprefixes. 
# 2) Determine which modules will be included. They are kept on a property called <http://www.edmcouncil.org/skosify#domain> in skosify.ttl
# 3) Gather up all the RDF files in those modules
# 4) Run the shemify rules.  This adds a ConceptScheme to the output. 
# 5) Merge the ConceptScheme triples with the SKOS triples
# 6) Convert upper cases.  We have different naming standards in FIBO-V than in FIBO.  
# 7) Remove all temp files. 
#
# The output is in .ttl form in a file called fibo-v.ttl


export FIBO_INFRA=../../../../fibo-infra

# 1) Start the output with the standard prefixes.  They are in a file called skosprefixes. 

echo "# baseURI: http://www.edmcouncil.org/skos/vocabulary" > fibo-v.ttl 
cat skosprefixes >> fibo-v.ttl
# echo $JENA_HOME

# 2) Determine which modules will be included. They are kept on a property called <http://www.edmcouncil.org/skosify#domain> in skosify.ttl

$FIBO_INFRA/bin/apache-jena-3.0.0/bin/arq --data=./skosify.ttl --query=./getdomain.sq > domain
export domains=../../../$(grep \" domain | sed s/^[^\"]*\"// | sed s/\".*$// | sed "s/ / ..\/..\/..\//g")
echo $domains

# 3) Gather up all the RDF files in those modules.  Include skosify.ttl, since that has the rules
$FIBO_INFRA/bin/apache-jena-3.0.0/bin/arq   $(find  $domains -name "*.rdf" | sed "s/^/--data=/") --data=skosify.ttl --query=skosecho.sq --results=TTL > temp.ttl

# 4) Run the shemify rules.  This adds a ConceptScheme to the output. 
java -Xmx1024M -Dlog4j.configuration="file:$JENAROOT/jena-log4j.properties" -cp "$JENAROOT/lib/*;$FIBO_INFRA/lib;$FIBO_INFRA/lib/SPIN/spin-1.3.3.jar" org.topbraid.spin.tools.RunInferences http://example.org/example temp.ttl >> temp1.ttl

$FIBO_INFRA/bin/apache-jena-3.0.0/bin/arq   --data=temp1.ttl --data=schemify.ttl --query=skosecho.sq --results=TTL > temp2.ttl

java -Xmx1024M -Dlog4j.configuration="file:$JENAROOT/jena-log4j.properties" -cp "$JENAROOT/lib/*;$FIBO_INFRA/lib;$FIBO_INFRA/lib/SPIN/spin-1.3.3.jar" org.topbraid.spin.tools.RunInferences http://example.org/example temp2.ttl >> tc.ttl

# 5) Merge the ConceptScheme triples with the SKOS triples
$FIBO_INFRA/bin/apache-jena-3.0.0/bin/arq   --data=tc.ttl --data=temp1.ttl --query=echo.sq --results=TTL > fibo-uc.ttl



# 6) Convert upper cases.  We have different naming standards in FIBO-V than in FIBO.  
cat fibo-uc.ttl |  sed "s/uc(\([^)]*\))/\U\1/g" >> fibo-v.ttl

# 7) Remove all temp files. 
rm temp.ttl
rm temp1.ttl
rm temp2.ttl
rm tc.ttl
rm fibo-uc.ttl
rm domain


