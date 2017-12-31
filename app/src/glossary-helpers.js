export const termLabel = item => item['owlnames:label'] && item['owlnames:label']['@value']
export const termLabelOrId = item => termLabel(item) || item['@id']

export const termSynonym = item => item['owlnames:synonym'] && (
  'Synonym: ' + (
    Array.isArray(item['owlnames:synonym']
  ) ?
  item['owlnames:synonym'].map(
    (synonym, index) => {
      return ' ' + synonym['@value']
    }
  ) :
  item['owlnames:synonym']['@value'])
)

export const termDefinition = item => 'Definition: ' + (
  (item['owlnames:definition'] && item['owlnames:definition']['@value']) || ''
)
