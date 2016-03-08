# Run SPIN on the input file.  This isn't used at the moment. 

export FIBO_INFRA=../../../../fibo-infra

echo $JENA_HOME




echo "STARTING SPIN"

java -Xmx1024M -Dlog4j.configuration="file:$JENAROOT/jena-log4j.properties" -cp "$JENAROOT/lib/*;$FIBO_INFRA/lib;$FIBO_INFRA/lib/SPIN/spin-1.3.3.jar" org.topbraid.spin.tools.RunInferences "$1"
echo "ENDING SPIN"



