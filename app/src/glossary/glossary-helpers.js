//
// Some helper functions to parse the context of each term (or "item") in the array
// that we get back from spec.edmcouncil.org
//
export const termHasLabel = item => 'owlnames:label' in item

export const termId = item => item['@id']

export const termLabel = item => termHasLabel(item) && item['owlnames:label']['@value']
export const termLabelOrId = item => termLabel(item) || termId(item)

export const termHasSynonym = item => 'owlnames:synonym' in item

export const termSynonym = item => termHasSynonym(item) && (
  (Array.isArray(item['owlnames:synonym']) ?
    item['owlnames:synonym'].map(
      (synonym, index) => {
        return ' ' + synonym['@value']
      }
    ) :
    item['owlnames:synonym']['@value'])
)

export const termSynonymWithLabel = item => termHasSynonym(item) && (
  'Synonym: ' + termSynonym(item)
)

export const termDefinition = item => (
  (item['owlnames:definition'] && item['owlnames:definition']['@value']) || ''
)
