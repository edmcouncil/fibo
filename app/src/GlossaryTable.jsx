import React from 'react'
import { Table, TableBody, TableHeader, TableHeaderColumn, TableRow, TableRowColumn } from 'material-ui/Table'

// const GlossaryCell = (item) => (
  // {
  //   (
  //     item['owlnames:label'] &&
  //     item['owlnames:label']['@value']
  //   ) || item['@id']
  // }
  // <p>
  //   {
  //     item['owlnames:synonym'] && (
  //       'Synonym: ' + (
  //         Array.isArray(item['owlnames:synonym']
  //       ) ?
  //       item['owlnames:synonym'].map(
  //         (synonym, index) => {
  //           return ' ' + synonym['@value']
  //         }
  //       ) :
  //       item['owlnames:synonym']['@value'])
  //     )
  //   }
  // </p>
  // <p>
  //   {
  //     'Definition: ' + (
  //       (item['owlnames:definition'] && item['owlnames:definition']['@value']) || ''
  //     )
  //   }
  // </p>
// )

const termLabel = item => item['owlnames:label'] && item['owlnames:label']['@value']
const termLabelOrId = item => termLabel(item) || item['@id']

const termSynonym = item => item['owlnames:synonym'] && (
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

const termDefinition = item => 'Definition: ' + (
  (item['owlnames:definition'] && item['owlnames:definition']['@value']) || ''
)

const rowFunction = (item, index) => (
  <TableRow key={index}>
    <TableRowColumn
      style={{
        whiteSpace: "normal",
        wordWrap: "break-word"
      }}
    >
      {termLabelOrId(item)}
      <p>
        {termSynonym(item)}
      </p>
      <p>
        {termDefinition(item)}
      </p>
    </TableRowColumn>
  </TableRow> 
)

const Rows = props => {
  if (! Array.isArray(props.sortedGlossary) || props.sortedGlossary.length === 0) {
    return (
      <TableRow>
        <TableRowColumn>No Glossary</TableRowColumn>
      </TableRow>
    )
  } else {
    return props.sortedGlossary.map(rowFunction)
  }
}

const GlossaryTable = props => (
  <Table
    fixedHeader={true}
    fixedFooter={false}
    selectable={false}
    multiSelectable={false}
  >
    <TableHeader
      displaySelectAll={false}
      adjustForCheckbox={false}
    >
      <TableRow>
        <TableHeaderColumn>Term</TableHeaderColumn>
      </TableRow>
      </TableHeader>
    <TableBody
      displayRowCheckbox={false}
      deselectOnClickaway={true}
      showRowHover={true}
      stripedRows={true}
    >
      <Rows {...props} />
    </TableBody>
  </Table>
)

export default GlossaryTable