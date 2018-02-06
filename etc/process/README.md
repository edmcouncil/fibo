# The FIBO publishing process

FIBO is developed in many ways as if it were a standard software
development process. Although the various "source files" are not really
the source files of programming languages like Java or C++, we can
consider them to be just the same, they're sources by any means.

## Authoritative Sources

The core authoritative source files are the OWL files in the main
FIBO git repository: [https://github.com/edmcouncil/fibo](https://github.com/edmcouncil/fibo).

Examples of authoritative OWL2 files as they exist as "source files" in Github are:

- [FND - Law/Jurisdiction](https://github.com/edmcouncil/fibo/blob/master/fnd/Law/Jurisdiction.rdf)
- [BE - LegalEntities/LEIEntities](https://github.com/edmcouncil/fibo/blob/master/be/LegalEntities/LEIEntities.rdf)

Such files are "published" (or "built" in programmer's terms) on https://spec.edmcouncil.org as:

- [FND - Law/Jurisdiction](https://spec.edmcouncil.org/fibo/ontology/master/latest/FND/Law/Jurisdiction/)
- [BE - LegalEntities/LEIEntities](https://spec.edmcouncil.org/fibo/ontology/master/latest/BE/LegalEntities/LEIEntities/)

Besides these OWL files, we also have some other authoritative sources
such as UML files.

## Terms

We're using a number of terms in the publishing process that have their own EDM Council specific definition:

- [Family](#family)
- [Product](#products)
- [Module](#directories--modules)
- [Version](#tags-versions-and-releases)
  - Branch
  - Tag
  - Release
- [Maturity Level](#maturity-levels) (Production/Development)
- Serialization Format

## Family

The Enterprise Data Management Council produces a number of product families such as:

- [FIBO](https://www.edmcouncil.org/financialbusiness)
- [DCAM](https://www.edmcouncil.org/dcam)

And some more insignificant ones such as:

- [RDF Toolkit](https://github.com/edmcouncil/rdf-toolkit)

In the context of the document, when we mention the term `family` we mean `fibo`.

## Products

So, FIBO itself is a "product family" that consists of a number of products.

Here are the primary products and their product keys (more about that later):

1. [`ontology`](https://spec.edmcouncil.org/fibo/ontology/master/latest/)

   The FIBO Ontologies, the primary product, the core OWL2 ontologies that are the foundation and source of record 
   for any of the other derived products in the product family.
   
   These are all of the about 30 mature modules and sub-modules developed by the [FIBO Team](../team.md) for nearly a
   decade. They are in W3C OWL and can be opened with any RDF-compliant tool. FIBO is published in multiple RDF
   serializations, including RDF/XML, Turtle, JSON-LD and NQUADS. See the Supported Formats table below to access FIBO
   in these forms.

1. [`glossary`](https://spec.edmcouncil.org/fibo/glossary/master/latest/)

   The FIBO Glossary.	This is a searchable Glossary of terms in HTML.

1. [`vocabulary`](https://spec.edmcouncil.org/fibo/vocabulary/master/latest/)

   The FIBO Vocabulary consists of a SKOS-taxonomy of terms.

1. [`datadictionary`](https://spec.edmcouncil.org/fibo/datadictionary/master/latest/)

   The FIBO Data Dictionary	is a spreadsheet version (in the form of a CSV file) of the terms and definitions in FIBO.

1. [`widoco`](https://spec.edmcouncil.org/fibo/widoco/master/latest/)

   The FIBO Ontologies VOWL Visualization	The Visual Notation for OWL Ontologies (VOWL) defines a visual language for the user-oriented representation of ontologies. It provides graphical depictions for elements of the Web Ontology Language (OWL) that are combined to a force-directed graph layout visualizing the ontology.
   
1. `smif`
	
	 Sample UML Diagrams of FIBO.	The Semantic Modeling for Information Federation (SMIF) spec allows round tripping 
	 between UML and OWL.

1. `uml`
  
   The UML representations of the models that are represented in the OWL
   ontologies.

1. [`ldf`](http://fragments.edmcouncil.org/)

   The [Linked Data Fragments](http://linkeddatafragments.org/) (LDF) version of FIBO is not really a downloadable 
   product but more like an online web service running on http://fragments.edmcouncil.org which will show for any 
   published version of FIBO the "ldf view" of it. See http://linkeddatafragments.org/
   
   The purpose of this server is to enable intelligent clients that can process triples in client side SPARQL. 
   A triple pattern specification is very lightweight, and still allows SPARQL endpoint like access of data. 
   One can look at this protocol method as sitting between a full RDF dump file and a SPARQL endpoint. 
   Somewhere in the middle of the spectrum. It is planned to offer client implementation from this server after 
   some further testing and finding some handy queries to prepopulate. Other fragments servers in production can 
   be found [here](http://data.linkeddatafragments.org/).

1. [`schema.org`](http://schema.org/docs/financial.html)

   A "flattened down" version of the FIBO ontologies, made suitable for
   use in search engines like Google and Bing, as an extension to schema.org,
   this is the "fibo.schema.org" source.
   
   >The schema.org product has its own build/test/deploy/publish cycle and is not published on 
   >https://spec.edmcouncil.org, where in a later phase it is expected to end up under 
   >https://spec.edmcouncil.org/fibo/schema.org . 
   >At the moment it is published here: http://schema.org/docs/financial.html


These are the "product keys", as they're also used in the URLs that
are published on https://spec.edmcouncil.org:

- `https://spec.edmcouncil.org/fibo/ontology/...`
- `https://spec.edmcouncil.org/fibo/glossary/...`
- `https://spec.edmcouncil.org/fibo/vocabulary/...`
- `https://spec.edmcouncil.org/fibo/datadictionary/...`
- `https://spec.edmcouncil.org/fibo/widoco/...`

Then actually, we do also have a few other "products" that can be treated in the same
way as the above products, so we assign product keys to them as well:

1. [`doc`](https://spec.edmcouncil.org/fibo/doc/)

   The primary generated FIBO documentation. Special software, still to be developed
   (although parts already exist), will be used to generate an HTML5 website with the
   full documentation of all the various components of FIBO.

   >Next to product keys like
   >'doc' we can support vendor specific product keys like `vendor-adaptive`, 
   >`vendor-topquadrant`, `vendor-complexible`, `vendor-ontotext` and so forth.
   >Whatever they want to deliver or add to the overall site can be placed here, where
   >the council will forward all traffic to a host of their specification.

2. [`static`](https://spec.edmcouncil.org/static/)

   All static content such as logos, javascript, stylesheets and the like.
   
   >NOTE: We will have to split this up into `/static`, `/fibo/static` and `/fibo/static/<branch>/<tag>`

## Directories & Modules

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
"Modules" and at the second level we have the "Sub-modules".

- All FIBO Modules are stored in their own separate directory in the single Git
  repository called fibo.  These directories are named for each of the
  FIBO Modules, e.g., [`/fnd`](https://github.com/edmcouncil/fibo/tree/master/fnd) (Foundations), 
  [`/be`](https://github.com/edmcouncil/fibo/tree/master/be) (Business Entities), 
  [`/ind`](https://github.com/edmcouncil/fibo/tree/master/ind) (Indices & Indicators), etc.
  
  These directories are siblings in the root directory of the FIBO
  repository. (Actually, the directory [`/etc`](https://github.com/edmcouncil/fibo/tree/master/etc) is the only exception to
  this rule)
  
- Each Module directory contains a number of sub-directories
  corresponding to the "Sub-modules" of that Module. The names of these
  directories are in ["UpperCamelCase"](http://c2.com/cgi/wiki?UpperCamelCase)
  such as `/be/Corporations/`. 
  
- Then there's an optional third level, such as 
  [`/fbc/FunctionalEntities/NorthAmericanEntities`](https://github.com/edmcouncil/fibo/tree/master/fbc/FunctionalEntities/NorthAmericanEntities), 
  where `NorthAmericanEntities` is a "Sub-sub-module".

# Branches

The FIBO development process is organized in several streams of work
that in the software development world are usually called branches,
which is the technical term as it is being used in git.
In the FIBO context a branch is a stream of work, where the `master` branch
is the stream where everything comes together. In every branch git maintains a "pointer"
usually called `HEAD` that points to the latest and greatest approved version of FIBO,
we're calling that `latest` in the IRIs. Besides this automatically maintained pointer,
we can also freeze such a pointer under a given name, also called `tag`, such as `2017Q4`
or so. See [Tags, Versions and Releases](#tags-versions-and-releases).

Besides the `master` branch we also have "feature branches" or "issue branches",
which usually get created from the master branch, where the name of the issue branch is
equal to the corresponding JIRA issue key such as `BE-123`.

The branch and tag name come back in the URL of a published artifact on https://spec.edmcouncil.org 
for instance like:

- `https://spec.edmcouncil.org/fibo/ontology/master/BE/latest/Corporations/..` -> 'master/latest'
- `https://spec.edmcouncil.org/fibo/vocabulary/master/2017Q4/all.ttl`  -> 'master/2017Q4'

See for a more detailed explanation below

# Tags, Versions and Releases

Then, next to the branch mechanism, as another dimension, cross-cutting
through the git repository, you can use the git tagging facility to set
a tag in the current checked-out branch in your local clone of the repository. 

Since pull requests (TODO: link to pull request info) can only contain commits,
tags cannot go via the standard pull request process. 
So tags can only be set by the members of the Owners-group of the root/main 
FIBO repository which currently is set to only the members of the FLT (FIBO Leadership Team)
(TODO: Link to ../team.md)

We use tags to signify important milestones in the development of FIBO,
this corresponds with Versions and Releases. The term "version" comes
from JIRA, where we can define versions and associate issues with
these versions. 

Once a version is actually "tagged" as such, it becomes
a release which is a term that is also shown in Github itself.
So tag, milestone, version and release all more or less mean the same
thing, the technical way to establish it is to set a tag.

Tags have a name, for that name we have the following convention:

### Version numbers

- In git: `X.Y.Z` where:
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

### Querterly releases

The format for quarterly release tags is '<year>Q<quarter number>[S<sequence number>]'

Where:

- <year> is the 4 digit year
- <quarter> is 1,2,3 or 4
- <sequence> is optional, starting with 1 (zero being the assumed default). This is only used in cases where we need to publish multiple releases per quarter.
   
## Links

- [Publishing Process](README.md)
- [artifacts](artifacts.md)
- [IRI Scheme](iri-scheme.md)
- [hosting](hosting.md)

