let glossaryJsonIRI
const apiVersion = 'v1'

const hostname = window && window.location && window.location.hostname

if(hostname === 'localhost') {
  glossaryJsonIRI = 'http://localhost:' + window.location.port + '/data/test-glossary.jsonld'
} else if(hostname === 'spec.edmcouncil.org') {
  glossaryJsonIRI = 'https://spec.edmcouncil.org' + window.location.pathname + 'XXXX'
}

export const GLOSSARY_JSON_IRI = glossaryJsonIRI
