# Artifacts

Artifacts are deliverables, single files that are produced by a build
process by an automated ["continuous integration" (CI)](https://www.thoughtworks.com/continuous-integration)
platform like Jenkins, from the original git-based authoritative sources.

The artifacts, and NOT the sources themselves, are the "things" that
need to be tested and evaluated on a continuous basis. FIBO end users
will only be exposed to the artifacts so that's what we need to test,
not the sources.

Building the artifacts and storing them on `https://spec.edmcouncil.org`,
thereby making them visible publically, is also called "publishing".

So the artifact builder is also called "the publisher" where for each
"flavor" of FIBO we might have different programs that take care of the 
specifics of generating the flavor-specific artifacts.

Since every approved change, coming in via a "code-reviewed" and accepted
pull-request into the main FIBO repository, needs to be tested by automated
processes and needs to be evaluated by humans, we need to publish each
and every change and generate all artifacts with their own version
number or branch color. Actually, the publisher process itself is one
of those tests, a major one even. If it gets through the publisher
without any warnings or errors, your change was probably valid.

## Types of Artifacts

- RDF and OWL files (see Serialization Formats below)
- HTML, CSS and Javascript files
- UML files
- Graphviz files and other images

# Serialization Formats

For the `ontology` and `vocabulary` flavors of FIBO, the primary publishing
format is RDF. Even the OWL files are usually stored as RDF (although not all
OWL formats are actually RDF).

The main RDF serialization formats are:

- [RDF 1.1 Turtle](https://www.w3.org/TR/turtle/)
- [RDF 1.1 N-Triples](https://www.w3.org/TR/n-triples/)
- [RDF 1.1 N-Quads](https://www.w3.org/TR/n-quads/)
- [RDF 1.1 XML-Syntax](https://www.w3.org/TR/rdf-syntax-grammar/) (also called `RDF/XML`)
- [RDF 1.1 TriG](https://www.w3.org/TR/trig/) (an extension to the Turtle format supporting named graphs)
- [JSON-LD 1.0](https://www.w3.org/TR/json-ld/)
- [RDF 1.1 JSON Alternate Serialization (RDF/JSON)](https://www.w3.org/TR/rdf-json/) (An alternative to JSON-LD which is the recommended format)
- [Notation 3 (N3)](https://www.w3.org/TeamSubmission/n3/)
- [TriX)[https://en.wikipedia.org/wiki/TriX_(syntax)] (Triples in XML)
- [RDFa](https://www.w3.org/TR/rdfa-primer/) (with several flavors, like RDFa 1.1 Core, RDFa 1.1 Lite etc)
- [RDF Thrift](http://afs.github.io/rdf-thrift/rdf-binary-thrift.html) (a binary RDF serialization format)
- [HDT](http://www.rdfhdt.org/) (yet another binary RDF serialization format, see also [W3C submission](https://www.w3.org/Submission/HDT/))

The main OWL serialization formats are:

- RDF/XML
- [OWL/XML](https://www.w3.org/TR/owl2-xml-serialization/)
  - Notational variant of the Functional Style Syntax.
  - Does not use RDF triples, but simply XML tree structure
- Turtle
- [OWL 2 Functional-style Syntax](https://www.w3.org/TR/owl2-syntax/#Functional-Style_Syntax)
  – Prefix-syntax, given as formal grammar
  – Clean, adjustable, modifiable, easily parsable
  – Used for defining OWL 2 in the W3C Specs.
- [Manchester Syntax](https://www.w3.org/TR/owl2-manchester-syntax/)
  – User-friendly syntax, used in tools like Protégé

We're "probably" not going to support ALL of these formats but only the most popular ones.
It shouldn't really matter though to add a few more, whenever there's a customer with a preference for a given
format.

## Links

- [Publishing Process](README.md)
- [artifacts](artifacts.md)
- [IRI Scheme](iri-scheme.md)
- [hosting](hosting.md)
