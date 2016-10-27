# FIBO Artifacts IRI Scheme

## Intro

Artifacts are the result of a build process. In the central FIBO git repository we have our "sources", the authoritative
"golden copy" of information that defines what FIBO is. Any change to those sources will trigger "a build", which is a
number of "jobs" that run in a "pipeline" on the Jenkins server (https://jenkins.edmcouncil.org). The first jobs that run
will test everything, to see if the change (also called "the commit") caused any of these tests to fail. When all tests
pass, other jobs will be triggered in the same pipeline, that will gneerate all the various artifacts for all the various "[flavors](#flavors)" of FIBO. These artifacts can be OWL-files in all well known formats or whole web-sites. Point is
that all these artifacts have to be tested themselves as well. Either by yet other automated Jenkins processes or by
people. This testing includes the artifact-generation (or artifact-publication so you will) itself. This is one of the
major reasons why we cannot "just" publish the authorized version, we have to "build" and "publish" each and every
intermediate version, each "commit" to the repository, over and over again. "Build" and "Publish" in our case means the
same thing. The IRI Scheme has to support all this, where FIBO users will have to be provided with a very easy way to
get the version that's right for them.

For all FIBO artifacts that we publish in the domain ```fibo.org``` we have a strict IRI scheme.

This scheme is strict because:

- all artifacts are published by fully automated processes
  - so the IRI scheme has to be consistent
- we never delete any versioned artifacts so the IRI scheme has to accomodate for that
  - all versions of all versioned artifacts can always be downloaded from the site
  - so we cannot change this URL scheme for many years to come, it has to accomodate for
    that kind of stability and be flexible enough to support other types of artifacts that
    we didn't foresee.
- all artifacts have dependencies on other artifacts, these dependency "graphs" need to be supported
- we need to be able to support versioned artifacts next to "latest" artifacts
  - Similar in concept to the difference between "tags & branches" in git
- we need to be able to support many different technologies, both generated "static" artifacts as well as
  "dynamic" web sites etc.

## The IRI Scheme

### Proposal 1

```
https://<product>.fibo.org/<release>/<artifact>
```
As you can see, there's no `<family>` component in this IRI, assuming that all we ever publish on `fibo.org` is obviously part of the FIBO "family". (See [Families](#families) below)

### Proposal 2

```
https://spec.edmcouncil.org/<family>/<product>/<release>/<artifact>
```

Where:

| IRI Element  | Options |
| ------------ | ------- |
| `<family>`   | is the product-family, either `FIBO` or `DCAM`, see [Families](#families) below |
| `<product>`  | (formerly known as `flavor`) is (currently) one of `ontology`, `vocabulary`, `uml` or `schema`, see [Products](#products) below |
| `<release>`  | A release identifier uniquely identifies a specific release of an artifact, consisting of a `<color>` and a `<version>` identifier. See [Releases](#releases) below. |
| `<artifact>` | A `<product>`-specific identifier for the given artifact, see [Artifacts](#artifacts) below |

### Families

The EDM Council has two product families:

* FIBO - Financial Industry Business Ontology
* DCAM - Data Management Capability Model

#### Notes

- We could perhaps call this just "product line" which is a more common term than "family" for a line of products?
- The original idea was to embed the product family name in the IRI like `https://spec.edmcouncil.org/FIBO/bla`.
  This would allow the council to publish many other product families in the future, basically becoming a standards
  organization itself, like OMG or W3C, where the brand name of the EDM Council was supposed to be part of the IRI
  as `edmcouncil.org` showing the authoritative source.
  However, that distracts from the brand name FIBO itself. Which message do you want to convey to the market, which name
  are we going invest our marketing efforts for? FIBO or EDM Council or both? From a marketing perspective just focussing on
  one easy to remember brand name like FIBO is obviously more effective. We can embed the name EDM Council as copyright
  holder and authoritative source in all kinds of places in each and every published artifact.
- DCAM (it's a model right?) should perhaps be modelled as an ontology itself? And become part of FIBO?

### Products

For the FIBO product-family we have currently the following products (formerly known as "flavors"), but many others might follow:

| Letter | Mnemonic | IRI Name        | Name               | Notes |
|:------:| -------- | --------------- | ------------------ | ----- |
| O      | FIBO-O   | `ontology`      | FIBO OWL           | Plus diagram files, plus test data files |
| V      | FIBO-V   | `vocabulary`    | FIBO-V             | SKOS RDF |
| U      | FIBO-U   | `uml`           | FIBO UML           | ? |
| S      | FIBO-S   | `schema`        | FIBO schema.org    | The content for fibo.schema.org plus the mappings to FIBO-O |
| D      |          | `documentation` | FIBO documentation | Generated comprehensive documentation at the product family level |

Other products could be:

- The generated documentation for the overall product line or parts thereof.
  - Can be generated by vendors on their Jenkins slave servers.
  - We would end up with multiple types of documentation, all within the same IRI scheme therefore every vendor or
    every tool gets its own product-name like `topbraid-evn` or `stardog-x` or `ontotext-y`.
- Content on `spec.edmcouncil.org` or `fibo.org` does not necessarily have to be generated static content, it can also
  be content that is dynamically generated by a product. For instance, the latest versions of the FIBO ontologies could
  be stored in a triple store like Stardog where `https://stardog.fibo.org/pink/latest/<artifact>` points to whatever
  page of a running Stardog server hosting the latest pink version of FIBO in a specific database.
- The EDM Council should invest in the developmemt of their own documentation website that generates content at the right
  places, such as when people land on the page `https://fibo.org` or `https://ontology.fibo.org`, allowing users to drill
  down through the hierarchy of products, branches, releases etc. This should make it easy for FIBO users to find what they're
  looking for. This should include general documentation, picked up from Markdown files (such as the page you're reading
  right now, as well as content generated from the underlying artifacts, such as the OWL files.

### Releases

A `<release>` consists of:

```
<branch>/<version>
```

#### Examples

- `pink/1.2.3`
- `yellow/latest`
- `issue-flt-65/latest`

### Branches

A `<branch>` (formerly known as "color") represents the maturity level of FIBO. 
We currently recognise the following maturity levels:

| Branch     | Maturity Level | Status |
| ---------- | -------------- | ------ |
| `red`      | Incubation | No longer in use |
| `babypink` | Work in Progress, all FIBO Content Teams regularly submit their work into `babypink` | Proposal |
| `pink`     | All agreed upon across all teams, bleeding edge usable version. | In Use |
| `yelllow`  | Work in Progress in preparation for submission to the OMG | In Use | 
| `green`    | OMG Ratified version | In Use |

#### Notes

- `pink` is basically the `master` branch
- One idea is to have each FIBO Content Team (FCT) have their own sub-brances like `babypink/fnd` for the
  Foundations team for instance. The various team members who work in their own forks of the central FIBO repository
  could then merge into this team branch without bothering anyone else, before they would create one larger pull request
  for submission into `babypink` or straight into `pink`. The disadvantage of this approach is that it would take even
  longer for all teams to merge all changes into one central branch, with the risk of more merge conflicts and duplicated
  efforts or even efforts that were not necessary in the first place.
- Another idea is to allow for issue branches, (we really shouldn't call these issue-colors shouldn't we?),
  like `issue/FLT-65`, where all forks of all contributors submit their changes into, before a pull request is created
  from such an issue branch into the main (`pink`) branch. This would allow us to see in JIRA but also all the way down
  to the published artifacts, which commits were involved in which JIRA ticket, who did what when where and would "force"
  everyone to move ahread in small incremental (and Agile) steps focussed around issues.
- Whenever a branch name has a slash in it, like `issue/FLT-65`, the publication processes will have to translate that
  slash to a hyphen, (and will lowercase it) so the `<branch>` becomes then `issue-flt-65`.
- *Any* branch name will be a valid value for `<branch>`, but it will be lowercased and slashes become hyphens.
- Any commit on any branch will trigger the Jenkins test and publication jobs. All changes that pass the tests will lead
  to published artifacts.

### Versions

`<version>` is either a tagged version of FIBO or the latest edition of a given branch:

- Tagged version: '<major>.<minor>.<fix>[.<build>]`
  - When tags are set in the git repo to be used as a `<version>` in the IRI Scheme, they have to have the format
    `<color>-<major>.<minor>.<fix>` where `<color>` is the lower case branch name where slashes have been replaced
    by hyphens.
  - When it's just yet another "build", meaning that it's not a build of tagged commit, we add a sequential build number.
- `latest`
  - Points to the HEAD of the given branch (as indicated by the `<color>`). HEAD is the technical git term for it.
    It means that it always points to the latest (and greatest?) version of the given branch.

#### Notes

- The publisher jobs really generate two different artifacts for each build. For instance, for the ontology-publisher, we
  would actually need two different OWL files, one that contains versioned IRIs and one that contains the 'latest` IRIs, so
  for instance all `owl:import` statements in each published OWL file would start with
  `https://ontology.fibo.org/pink/latest` in one of of the two published artifacts and with
  `https://ontology.fibo.org/pink/1.2.3.4` in the other.
- We could also support other keywords than `latest` such as `current` or `head`.
  We could support all of them or just one.

### Artifacts

For each `<product>`, the `<artifact>` part in the IRI has its own scheme. For the four major products we have the following `<artifact>` IRI schemes:

#### Ontology Artifacts

`<artifact>' for the FIBO ontologies can either be an artifact as a file or an axiom identifier as defined in an OWL ontology, so there are two forms:

* `<domain>/<ontology>.<format>[.<compression>]` - File
* `<domain>/<ontology>/<axiom identifier>` - Axiom

- `<domain>`
- `<ontology>` can consist of two or three parts, such as
  - `AgentsAndPeople/Person` or
  - `FunctionalEntities/USJurisdiction/USExampleIndividuals`
- `<axiom identifier>`

#### Vocabulary Artifacts

#### UML Artifacts

#### Schema.org Artifacts

## Examples

The ontology axiom IRI that identifies the class Person:

```
https://ontology.fibo.org/pink/latest/FND/AgentsAndPeople/Agents/Person or
https://spec.edmcouncil.org/FIBO/pink/latest/FND/AgentsAndPeople/Agents/Person
```

The ontology file name for the OWL file, in RDF/XML format (`.rdf`) that defines the previous axiom:

```
https://ontology.fibo.org/pink/latest/FND/AgentsAndPeople/Agents/Person.rdf or
https://spec.edmcouncil.org/FIBO/pink/latest/FND/AgentsAndPeople/Agents/Person.rdf
```


