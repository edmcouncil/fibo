Pellint
-------

Pellint (short for "pellet lint" command) is a lint tool for OWL ontologies 
that detects problematic modeling constructs (patterns) that may have an 
impact on the ontology's reasoning performance in Pellet and which, upon 
request, repairs them where possible. In addition, if the ontology is in 
RDF/XML format, Pellint also checks that all RDF resources are properly 
typed.                                       

Pellint currently supports detection of 9 easily configurable patterns.     
To find out more information on these patterns and how to configure them,   
please see PELLET-PATTERNS.txt.                                                    

See "Extending Pellint" section below for more info about adding new        
patterns to Pellint.


Running
-------
Pellint is intregrated into the Pellet command line tool. To run pellint,
type:
pellet.bat (or pellint.sh on Unix) lint [OPTIONS] ONTOLOGY
   ONTOLOGY       The input ontology file/URI to analyze

 OPTIONS:
   -f   FILE      Apply fixes (where applicable) on the found lints,
                  and save the new ontology to FILE
   -r             Analyze the root ontology only, not any of its imports
   -o [RDF|OWL]   RDF: only analyze RDF type declarations (RDF/XML only)
                  OWL: only analyze OWL axioms
   -v --version   Print the version information and exit
   -h --help      Print help message



Extending Pellint
-----------------

The following is a step-by-step guide on how to implement your own pattern  
for use in Pellint.  For convenience <PELLET> stands for Pellet's    
root directory.                                                             

(1) Make sure you can build Pellet using "ant dist".

(2) Implement your pattern as a Java class in a new file:

  (2.1) If your pattern always matches against one single axiom, then       
  extend AxiomLintPattern and implement necessary methods, including a way  
  to repair a lint where possible.                                          

  (2.2) If your pattern needs to match against the entire ontology, then    
  implement OntologyLintPattern and its necessary methods, including a way  
  to repair a lint where possible.                                          

Refer to the Javadocs on these interfaces for further details.

(3) Place your new pattern file anywhere under <PELLET>/pellint/src so that Ant    
can include it in the build.  Run "ant dist" to rebuild Pellint with the    
new pattern.                                                                

(4) Update <PELLET>/pellint/src/pellint.properties and add your new pattern to    
the configuration.  Please refer to the comments included in the head of    
this file for details.                                                      

(5) Run pellet directly (not with .bat or .sh script) using the following  
command so that it runs the newly built Pellint and uses the modified       
configuration file:                                                         

    java -Dpellint.configuration=file:<PELLET>/pellint/src/pellint.properties -jar dist/lib/pellet.jar lint [OPTIONS] ONTOLOGY


Support
-------

For best-effort support of Pellint, Pellet, etc, please direct email        
inquiries to the Pellet Users list: pellet-users@lists.owldl.com.           
