DIR=`(dirname $0)`   
cat $DIR/top > catalog-v001.xml
FIBOREL=../  # This needs to be the relative pathname for fibo from the place where you are running this. 
grep -r 'xml:base=' $FIBOREL $FIBOREL/../LCC | grep '.rdf' | grep -v '/etc/' | sed -f $DIR/cat.sed >> catalog-v001.xml
cat $DIR/tail >> catalog-v001.xml
