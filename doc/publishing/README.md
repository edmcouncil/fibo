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

- `ontology`
  The primary product, the core OWL ontologies that are the foundation
  for any of the other flavors of FIBO.
- `vocabulary`
  The "FIBO-V" flavor, the vocabulary, which is based on the SKOS standard,
  a vocabulary or taxonomy or "concept scheme" that is built up from all
  the terms in the OWL ontologies.
- `schema.org`
  A "flattened down" version of the FIBO ontologies, made suitable for
  use in search engines like Google and Bing, as an extension to schema.org,
  this is the "fibo.schema.org" source.
- `uml`
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
checked out branch in your local clone of the repository. Since pull
requests can only contain commits, tags cannot go via the standard
pull request process. So tags can only be set by the members of the
Owners-group of the root/main FIBO repository which currently is set
to only the members of the FLT (FIBO Leadership Team).

We use tags to signify important milestones in the development of FIBO,
this corresponds with Versions and Releases. The term version comes
from JIRA, where we can define versions and associate issues with
these versions. Once a version is actually "tagged" as such, it becomes
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
"flavor" of FIBO we might have different programs that take care of the 
specifics of generating the flavor-specific artifacts in the

Once the publication 

# Serialization Formats

