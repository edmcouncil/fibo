
# 
#
# finds all the classes defined in ontologies imported by the ontology given in dependencies.sq
#
# How this works
# $( ... ) runs the command inside the parens, and puts the results into the command line. 
# find searches all the given directories for files named "*.rdf".  
# Pipe this into sed, to make them --data=<path> 
#
# Reads all those files, merges them together in RDF, and runs the SPARQL query in dependencies.sq
#


arq  $(find c:/Users/Dean/Documents/fibo/be c:/Users/Dean/Documents/fibo/der c:/Users/Dean/Documents/fibo/fbc c:/Users/Dean/Documents/fibo/fnd c:/Users/Dean/Documents/fibo/ind c:/Users/Dean/Documents/fibo/loan c:/Users/Dean/Documents/fibo/sec -name "*.rdf" | sed "s/^/--data=/") --query=dependencies.sq 
