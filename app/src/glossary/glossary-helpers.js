//
// Some helper functions to parse the context of each term (or "item") in the array
// that we get back from spec.edmcouncil.org
//

//
// ID
//
export const termId = item => item['@id']

//
// Label
//
export const termHasLabel = item => 'owlnames:label' in item
export const termLabel = item => termHasLabel(item) && item['owlnames:label']['@value']
export const termLabelOrId = item => termLabel(item) || termId(item)

//
// Synonym
//
export const termHasSynonym = item => 'owlnames:synonym' in item
export const termSynonymItem = item => item['owlnames:synonym']
export const termSynonymValue = item => item['owlnames:synonym']['@value']
export const termSynonymArray = item => termHasSynonym(item) ? (
  Array.isArray(termSynonymItem(item)) ? termSynonymItem(item) : [ termSynonymItem(item) ]
) : []
export const termSynonym = item => termHasSynonym(item) && (
  Array.isArray(termSynonymItem(item)) ?
    termSynonymItem(item).map(
      (synonym, index) => {
        return ' ' + synonym['@value']
      }
    ) :
    termSynonymValue(item)
)
export const termSynonymWithLabel = item => termHasSynonym(item) && (
  'Synonym: ' + termSynonym(item)
)

//
// Definition
//
export const termHasDefinition = item => 'owlnames:definition' in item
export const termDefinitionValue = item => item['owlnames:definition']['@value']
export const termDefinition = item => (
  termHasDefinition(item) ? termDefinitionValue(item) : ''
)

//
// Logical Definition
//
export const termHasLogicalDefinition = item => 'owlnames:logicalDefinition' in item
export const termLogicalDefinitionValue = item => item['owlnames:logicalDefinition']['@value']
export const termLogicalDefinition = item => (
  termHasLogicalDefinition(item) ? termLogicalDefinitionValue(item) : ''
)
const termLogicalDefinitionRemoveBreakRegEx = /^<br\/>/ig
export const termLogicalDefinitionValueNoBreaks = item => item['owlnames:logicalDefinition']['@value'].replace(
  termLogicalDefinitionRemoveBreakRegEx, ''
)
export const termLogicalDefinitionNoBreaks = item => (
  termHasLogicalDefinition(item) ? termLogicalDefinitionValueNoBreaks(item) : ''
)


