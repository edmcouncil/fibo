# Reads fibo-v.ttl and creates a rdf/xml version (using the serializer)
# and a jsonld version (using riot)

java -Xmx1g "-Dorg.clapper.avsl.config=/tmp/sesame-serializer.log" -cp c:/Users/Dean/Documents/fibo/.git/hooks/rdf-toolkit.jar org.edmcouncil.rdf_toolkit.SesameRdfFormatter --source fibo-v.ttl --target fibo-v.rdf --target-format rdf-xml --use-dtd-subset -ibn -ibu -sdt explicit
riot --output=JSON-LD fibo-v.ttl > fibo-v.jsonld
