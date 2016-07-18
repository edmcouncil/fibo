# The FIBO publishing process

FIBO is developed in many ways as if it were a standard software
development process. Although the various "source files" are not really
the source files of programming languages like Java and C++, we can
consider them to be just the same, they're sources by any means.

The core authoritative source files are the OWL files in the main
FIBO git repository: https://github.com/edmcouncil/fibo

Besides these OWL files, we also have some other authoritative sources
such as UML files.

# Directories, Domains and Sub-domains

Let's first explain the structure of the directories in the FIBO git
repository, where we start with the two top level directories that more
or less look as follows:

- `be` (Business Entities)
  - `Corporations`
  - `FunctionalEntities`
  - ..
- `der` (Derivatives)
  - `DerivativesContracts`
  - `RateDerivatives`
  - ..
- `etc` (this is a reserved name, ignore this)
- `fbc` (Financial Business and Commerce)
  - `FinancialInstruments`
  - `FunctionalEntities`
    - `USJurisdiction`
    - ..
  - `ProductsAndServices`
  - ..
- ..

And so forth. As you can see, at the top level we have the FIBO
"Domains" and at the second level we have the "Sub-domains".

- FIBO Domains are stored in separate directories in a single Git
  repository called fibo.  These directories are named for each of the
  FIBO Domains, e.g., `/fnd`, `/be`, `/ind`, etc.
  These directories are siblings in the root directory of the FIBO
  repository. (Actually, the directory `/etc` is the only exception to
  this rule)
- Each Domain directory contains a number of sub-directories
  corresponding to the "Sub-domains" of that Domain. The names of these
  directories are in ["UpperCamelCase"](http://c2.com/cgi/wiki?UpperCamelCase)
  such as `/be/Corporations/`. 
- Then there's an optional third level, such as 
  `/fbc/FunctionalEntities/USJurisdiction`, where `USJurisdiction` is
  a "Sub-sub-domain".

# Products and Flavors

FIBO itself is a "product family" or a "product line" that consists of
a number of products which we usually call "flavors":

1. `ontology`

   The primary product, the core OWL ontologies that are the foundation
   for any of the other flavors of FIBO.

2. `vocabulary`

   The "FIBO-V" flavor, the vocabulary, which is based on the SKOS standard,
   a vocabulary or taxonomy or "concept scheme" that is built up from all
   the terms in the OWL ontologies.

3. `schema.org`

   A "flattened down" version of the FIBO ontologies, made suitable for
   use in search engines like Google and Bing, as an extension to schema.org,
   this is the "fibo.schema.org" source.

4. `uml`
  
   The UML representations of the models that are represented in the OWL
   ontologies.

These are the four "flavor keys", as they're also used in the URLs that
are published on https://spec.edmcouncil.org:

- `https://spec.edmcouncil.org/fibo/ontology/...`
- `https://spec.edmcouncil.org/fibo/vocabulary/...`
- `https://spec.edmcouncil.org/fibo/schema.org/...`
- `https://spec.edmcouncil.org/fibo/uml/...`

# Branches and Colors

The FIBO development process is organized in several streams of work
that in the software development world are usually called branches,
which is the technical term as it is being used in git.
However, the EDM Council decided to use the term "colors" for this,
where each color signifies a "maturity level" of FIBO:

- `red`
  initial ideas, incubation level
- `pink`
  the main development branch
- `yellow`
  the council's proposal to the OMG
- `green`
  the ratified OMG version of FIBO

Besides these color-branches we also have issue-branches, usually
taken from the pink branch, where the name of the issue branch is
equal to the corresponding JIRA issue key such as `BE-123`.

The branch or color name comes back in the URL of a published artifact
on https://spec.edmcouncil.org for instance like:

- `https://spec.edmcouncil.org/fibo/ontology/pink/be/Corporations/..`
- `https://spec.edmcouncil.org/fibo/vocabulary/BE-123/all.ttl`

See for a more detailed explanation below

# Tags, Versions and Releases

Then, as another dimension cross-cutting through the git repository,
you can use the git tagging facility to set a tag in the current
checked-out branch in your local clone of the repository. Since pull
requests can only contain commits, tags cannot go via the standard
pull request process. So tags can only be set by the members of the
Owners-group of the root/main FIBO repository which currently is set
to only the members of the FLT (FIBO Leadership Team).

We use tags to signify important milestones in the development of FIBO,
this corresponds with Versions and Releases. The term "version" comes
from JIRA, where we can define versions and associate issues with
these versions. 

Once a version is actually "tagged" as such, it becomes
a release which is a term that is also shown in Github itself.
So tag, milestone, version and release all more or less mean the same
thing, the technical way to establish it is to set a tag.

Tags have a name, for that name we have the following convention:

- In git: `vX.Y.Z` where:
  - `v` stands for version
  - `X` stands for the major version number
  - `Y` stands for the minor version number, where the combination of
    `X` and `Y` (`vX.Y`) should correspond with a JIRA version as well.
  - `Z` stands for a significant sequence number, a build or a fix.
- In JIRA: `X.Y`
  - See above
  - The `v` prefix is not necessary in JIRA so we don't use that here
  - We don't track fix/build numbers (`Z`) in JIRA
- On https://spec.edmcouncil.org: `X.Y.Z`
  - The tag comes back in the published URL, see below, which looks
    as follows: `https://spec.edmcouncil.org/fibo/ontology/1.2.3/be/...`
   

# Artifacts

Artifacts are deliverables, single files that are produced by a build
process by an automated "continuous integration" (CI) platform like
Jenkins, from the original git-based authoritative sources.

The artifacts, and NOT the sources themselves, are the "things" that
need to be tested and evaluated on a continuous basis. FIBO end users
will only be exposed to the artifacts so that's what we need to test,
not the sources.

Building the artifacts and storing them on https://spec.edmcouncil.org,
thereby making them visible publically, is also called "publishing".

So the artifact builder is also called "the publisher" where for each
"flavor" of FIBO we
ight have different programs that take care of the 
specifics of generating the flavor-specific artifacts.

Since every approved change, coming in via "code reviewed" and accepted
pull request in the main FIBO repository, needs to be tested by automated
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

# IRI scheme for all the Artifacts

Here's the IRI scheme for the `ontology` artifacts:

```
<protocol>://<host>/<family>/<product>/<branch|tag>/<domain>/<sub-domain>[/<sub-sub-domain>]/<artifact>[.<format>[.<compression>]]
```

Here's the IRI scheme for the `vocabulary` artifacts:

```
<protocol>://<host>/<family>/<product>/<branch|tag>/<artifact>[.<format>[.<compression>]]
```

Where:

| Element           | Description |
|-------------------|-------------|
| `protocol`        | Is always `https`, we do NOT support `http`, please be aware of the fact that the difference between using `http` and `https`, even though its only one letter, is in many cases significant. Two OWL axioms that only differ with this single letter are actually not the same thing. |
| `host`            | Is always `spec.edmcouncil.org` although the OMG ratified version of FIBO will be (also) published on the OMG site but they have as slightly different IRI scheme |
| `family`          | Is always `fibo` (lowercase), it could be that the EDM Council will publish other product lines like this as well such as DCAM |
| `branch` or `tag` | In case of a git branch name like `pink` or `BE-123` just use the exact same name in the exact same "case". In case of a tag, when the tag starts with `v` then remove the `v`, so `v1.2.3` becomes `1.2.3` |
| `domain`          | A top level domain, same as the directory names in the root of the fibo repository, such as `be`, `fnd` and so forth. |
| `sub-domain`      | .. |
| `sub-sub-domain`  | .. |
| `artifact`        | .. |
| `format`          | The file extension representing the serialization format, see the table of file extensions below |
| `compression`     | The compression encoding that should be used by the server, currently only `gz` is supported, see also the paragraph Accept-encoding below |

# HTTP Request headers

## Accept header

When `<format>` (and therefore also the `<compression>` part) are not part of the URL then the HTTP headers can be used to specify which format needs to be returned by the server. The so-called "Accept Request-header" can specify a list of MIME types, where each MIME type corresponds with one of the supported formats, for instance if you want the RDF/XML version of an ontology:

```
https://spec.edmcouncil.org/fibo/ontology/pink/be/LegalEntities/LegalPersons
```

Then specify the following HTTP header:

```
Accept: application/rdf+xml
```

If you want the same file as Turtle, specify this:

```
Accept: text/turtle`
```

See the paragraph "File extensions & MIME Types" below for a listing of the supported values of the Accept header (see column MIME Type)


## Accept-encoding

# File extensions & MIME Types

| Extension | MIME Type                                  | Description          |
|-----------|--------------------------------------------|----------------------|
| `rdf`     | `application/rdf+xml` or `application/xml` | RDF/XML format       |
| `owl`     | Not supported via accept header            | OWL/XML format       |
| 'ttl'     | `text/turtle` or `application/x-turtle`    | Turtle format        |
| `nt`      | `application/n-triples`                    | N-Triples format     |
| `n3`      | `text/n3` or `text/rdf+n3`                 | N3/Notation 3 format |
| `jsonld`  | `application/ld+json`                      | JSON-LD format       |
| `nq`      | `application/n-quads`                      | N-Quads format       |









