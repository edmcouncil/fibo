import React from 'react'
import { Table, TableBody, TableHeader, TableHeaderColumn, TableRow, TableRowColumn } from 'material-ui/Table'
import Highlighter from 'react-highlighter'
import {Card, CardActions, CardHeader, CardText} from 'material-ui/Card';
import * as glossaryHelpers from './glossary-helpers'

const rowFunction = (item, index) => (
  <Card>
    <CardHeader
      title={<Highlighter search={this.searchTerm} matchStyle={{ backgroundColor: 'yellow' }}>{glossaryHelpers.termLabelOrId(item)}</Highlighter>}
      subtitle={glossaryHelpers.termDefinition(item)}
      initiallyExpanded={false}
      actAsExpander={true}
      showExpandableButton={glossaryHelpers.termHasSynonym(item)}
    />
    {glossaryHelpers.termHasSynonym(item) ? 
      <CardText expandable={false}>
       {glossaryHelpers.termSynonym(item)}
      </CardText> : ''
    }
    
  </Card>
)

const FilteredGlossaryItems = props => {
  if (props.searchTerm === '') {
    return (
      props.sortedGlossary
    )
  } else {
    return (
      props.sortedGlossary.filter(item =>
        glossaryHelpers.termLabelOrId(item).indexOf(props.searchTerm) !== -1
      )
    )
  }
}

const GlossaryTable = props => {
  this.searchTerm = props.searchTerm
  if (! Array.isArray(props.sortedGlossary) || props.sortedGlossary.length === 0) {
    return (
      <div>No Glossary</div>
    )
  } else {
    return (
      FilteredGlossaryItems(props).map(rowFunction)
    )
  }
}

export default GlossaryTable