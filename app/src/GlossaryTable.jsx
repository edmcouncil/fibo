import React from 'react'
import { Table, TableBody, TableHeader, TableHeaderColumn, TableRow, TableRowColumn } from 'material-ui/Table'
import * as glossaryHelpers from './glossary-helpers'

const rowFunction = (item, index) => (
  <TableRow key={index}>
    <TableRowColumn
      style={{
        whiteSpace: "normal",
        wordWrap: "break-word"
      }}
    >
      {glossaryHelpers.termLabelOrId(item)}
      <p>
        {glossaryHelpers.termSynonym(item)}
      </p>
      <p>
        {glossaryHelpers.termDefinition(item)}
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
    if (props.searchTerm === '') {
      return (
        props.sortedGlossary.map(rowFunction)
      )
    } else {
      return (
        props.sortedGlossary.filter(item =>
          glossaryHelpers.termLabelOrId(item).indexOf(props.searchTerm) !== -1
        ).map(rowFunction)
      )
    }
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