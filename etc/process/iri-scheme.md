# IRI scheme for all the Artifacts

Here's the first part of the IRI scheme for all [artifacts](./artifacts.md):

## Base IRI Scheme

The Base IRI is the same for all FIBO products that are published on https://spec.edmcouncil.org/fibo :

```
<protocol>://<host>/<family>/<product>/<branch>/<tag>/...
```

## Ontology IRI Scheme

Here's the continued IRI scheme for the `ontology` artifacts:

```
.../<domain>/<sub-domain>[/<sub-sub-domain>]/<artifact>[.<format>[.<compression>]]
```

## Vocabulary IRI Scheme

Here's the continued IRI scheme for the `vocabulary` artifacts:

```
/<artifact>[.<format>[.<compression>]]
```

## Schema.org IRI Scheme

Here's the continued IRI scheme for the `schema.org` artifacts:

```
/<artifact>[.<format>[.<compression>]]
```

## UML IRI Scheme

Here's the continued IRI scheme for the `uml` artifacts:

```
/<artifact>[.<format>[.<compression>]]
```

## Documentation IRI Scheme

Here's the continued IRI scheme for the `doc` artifacts:

```
/<artifact>[.<format>[.<compression>]]
```

### Proposed layout for the ontology documentation

The documentation "site" could actually be a shadow of the other product IRI schemes, 
for instance one OWL class IRI could be backed by a documentation page as follows:

```
https://spec.edmcouncil.org/fibo/ontology/master/latest/FND/AgentsAndPeople/People/Adult
```

The above OWL class IRI could be represented in the documentation as follows:

```
https://spec.edmcouncil.org/fibo/ontology/widoco/master/latest/FND/AgentsAndPeople/People/index-en.html#Adult
```

## Static files IRI scheme

Here's the continued IRI scheme for the `static` artifacts:

```
/<artifact-type>/<artifact>[.<format>]
```

## Where:

| Element           | Description |
|:------------------|:------------|
| `protocol`        | Is always `https`, we do NOT support `http`, please be aware of the fact that the difference between using `http` and `https`, even though its only one letter, is in many cases significant. Two OWL axioms that only differ with this single letter are actually not the same thing. |
| `host`            | Is always `spec.edmcouncil.org` although the OMG ratified version of FIBO will be (also) published on the OMG site but they have as slightly different IRI scheme |
| `family`          | Is always `fibo` (lowercase), it could be that the EDM Council will publish other product lines like this as well such as DCAM |
| `branch` or `tag` | In case of a git branch name like `pink` or `BE-123` just use the exact same name in the exact same "case". In case of a tag, when the tag starts with `v` then remove the `v`, so `v1.2.3` becomes `1.2.3` |
| `domain`          | A top level domain, same as the directory names in the root of the fibo repository, such as `be`, `fnd` and so forth. |
| `sub-domain`      | A sub-domain as it is used (exactly) as a directory name at the second level in the repo's directory hierarchy. So this must be UpperCamelCase. |
| `sub-sub-domain`  | Same as `sub-domain` but then at the 3rd level. In the `ontology` product this field is optional. |
| `artifact`        | The meaning of the field `artifact` changes per product. In the `ontology` product this is the actual file name, without extension, of the OWL ontology (assuming that we only have 1 ontology per file). See the various artifact tables below for all possible values. |
| `artifact-type`   | For static files, this is `image` for all images, `javascript` for all Javascript and `css` for all CSS stylesheets. |
| `format`          | For RDF files: the file extension representing the serialization format, see the table of file extensions below. For any other files this is just the standard file extension like `.jpg` and `.gif` |
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
Accept: text/turtle
```

See the paragraph "File extensions & MIME Types" below for a listing of the supported values of the Accept header (see column MIME Type)


## Accept-encoding

If you want a compressed version of the artifact then you can do that either by specifying the full file name and adding the `.gz` extension, or
by specifying the Accept-encoding request-header as follows:

```
Accept-encoding: gzip
```

# File extensions & MIME Types

| Extension | MIME Type                                  | Description          |
|-----------|:-------------------------------------------|:---------------------|
| `rdf`     | `application/rdf+xml` or `application/xml` | RDF/XML format       |
| `owl`     | Not supported via accept header            | OWL/XML format       |
| `ttl`     | `text/turtle` or `application/x-turtle`    | Turtle format        |
| `nt`      | `application/n-triples`                    | N-Triples format     |
| `n3`      | `text/n3` or `text/rdf+n3`                 | N3/Notation 3 format |
| `jsonld`  | `application/ld+json`                      | JSON-LD format       |
| `nq`      | `application/n-quads`                      | N-Quads format       |


## Links

- [Publishing Process](README.md)
- [artifacts](artifacts.md)
- [IRI Scheme](iri-scheme.md)
- [hosting](hosting.md)
