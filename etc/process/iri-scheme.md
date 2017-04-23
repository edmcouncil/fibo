# FIBO Artifacts IRI Scheme

## Intro

Artifacts are the result of a build process. In the central FIBO git repository we have our "sources", 
the authoritative "golden copy" of information that defines what FIBO is. 
Any change to those sources will trigger "a build", which is a number of "jobs" that run in a 
"pipeline" on the Jenkins server (https://jenkins.edmcouncil.org). 
The first jobs that run will test everything, to see if the change (also called "the commit") 
caused any of these tests to fail. When all tests pass, other jobs will be triggered in the same 
pipeline, that will generate all the various artifacts for all the various "[products](#products)" 
of FIBO. These artifacts can be OWL-files in all well known formats or whole web-sites. Point is
that all these artifacts have to be tested themselves as well. Either by yet other automated Jenkins 
processes or by people. This testing includes the artifact-generation (or artifact-publication so 
you will) itself. This is one of the major reasons why we cannot "just" publish the authorized 
version, we have to "build" and "publish" each and every intermediate version, each "commit" to the 
repository, over and over again. "Build" and "Publish" in our case means the same thing. 

The IRI Scheme has to support all this, where FIBO users will have to be provided with a very easy 
way to get the version that's right for them.

For all FIBO artifacts that we publish in the domain ```spec.edmcouncil.org``` we have a strict 
IRI scheme.

This scheme is strict because:

- all artifacts are published by fully automated processes
  - so the IRI scheme has to be consistent
- we never delete any versioned artifacts so the IRI scheme has to accommodate for that
  - all versions of all versioned artifacts can always be downloaded from the site
  - so we cannot change this URL scheme for many years to come, it has to accommodate for
    that kind of stability and be flexible enough to support other types of artifacts that
    we did not foresee.
- all artifacts have dependencies on other artifacts, these dependency "graphs" need to be supported
- we need to be able to support versioned artifacts next to "latest" artifacts
  - Similar in concept to the difference between "tags & branches" in git
- we need to be able to support many different technologies, both generated "static" artifacts as well as
  "dynamic" web sites etc.

## The IRI Scheme

```
https://spec.edmcouncil.org/<family>/<product>/<release>/<artifact>
```

Where:

| IRI Element  | Options |
| ------------ | ------- |
| `<family>`   | is the product-family, either `fibo` or `dcam`, see [Families](#families) below |
| `<product>`  | is the product, such as `ontology`, `glossary`, or `schema.org`, see [Products](#products) below |
| `<release>`  | A release identifier uniquely identifies a specific release of an artifact, consisting of a `<branch>` and a `<tag>` identifier in the form `<branch>/<tag>` like for instance `master/latest` or `pink/1.2.3` See [Releases](#releases) below. |
| `<artifact>` | A `<product>`-specific identifier for the given artifact, see [Artifacts](#artifacts) below |

### Product Families

The EDM Council has the following product families (or product lines so yoy will):

| Product code as shown in IRI | Description |
| ---------------------------- | ----------- |
| `fibo`   | Financial Industry Business Ontology |
| `dcam`   | Data Management Capability Model |
| `rdfkit` | The RDF Toolkit |

### Products

For the FIBO product-family we have currently the following products, but many others might follow:

| Letter | Mnemonic | IRI Name        | Name               | Notes |
|:------:| -------- | --------------- | ------------------ | ----- |
| O      | FIBO-O   | `ontology`      | FIBO Ontology      | Plus diagram files, plus test data files |
| G      | FIBO-G   | `glossary`      | FIBO Glossary      | SKOS RDF, Excel |
| U      | FIBO-U   | `uml`           | FIBO UML           | ? |
| S      | FIBO-S   | `schema`        | FIBO schema.org    | The content for fibo.schema.org plus the mappings to FIBO-O |

### Releases

A `<release>` consists of:

```
<branch>/<tag>
```

#### Examples

- `pink/1.2.3`
- `master/latest`
- `issue-flt-65/latest`

### Branches

A `<branch>` represents the maturity level of FIBO. 
We currently recognise the following maturity levels:

| Branch     | Maturity Level | Status |
| ---------- | -------------- | ------ |
| `red`      | Incubation | No longer in use |
| `babypink` | Work in Progress, all FIBO Content Teams regularly submit their work into `babypink` | Proposal |
| `pink`     | All agreed upon across all teams, bleeding edge usable version. | In Use |
| `yellow`   | Work in Progress in preparation for submission to the OMG | In Use | 
| `green`    | OMG Ratified version | In Use |

### Tags

`<tag>` is either a git-tagged version of FIBO or the latest edition of a given branch:

- Tagged version: '<major>.<minor>.<fix>[.<build>]`
  - When tags are set in the git repo to be used as a `<tag>` in the IRI Scheme, they have to
    have the format
    `<branch>-<major>.<minor>.<fix>` where `<branch>` is the lower case branch name (where the tag
    was set) where slashes have been replaced by hyphens.
  - When it's just yet another "build", meaning that it's not a build of tagged commit, we add a 
    sequential build number.
- `latest`
  - Points to the HEAD of the given branch. HEAD is the technical git term for it.
    It means that it always points to the latest (and greatest?) version of the given branch.

### Artifacts

For each `<product>`, the `<artifact>` part in the IRI has its own scheme. 
For the four major products we have the following `<artifact>` IRI schemes:

#### Ontology Artifacts

`<artifact>' for the FIBO ontologies can either be an artifact as a file or an axiom 
identifier as defined in an OWL ontology, so there are two forms:

* `<module>/<ontology>.<format>[.<compression>]` - File
* `<module>/<ontology>/<axiom identifier>` - Axiom

- `<module>`
- `<ontology>` can consist of two or three parts, such as
  - `AgentsAndPeople/Person` or
  - `FunctionalEntities/USJurisdiction/USExampleIndividuals`
- `<axiom identifier>`

#### Glossary Artifacts

to do

#### UML Artifacts

to do

#### Schema.org Artifacts

to do

## Examples

The ontology axiom IRI that identifies the class Person:

```
https://spec.edmcouncil.org/fibo/ontology/master/latest/FND/AgentsAndPeople/Agents/Person
```
