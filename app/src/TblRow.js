import React, { Component } from 'react'
import { TableRow, TableCell } from 'material-ui/Table'
import Collapse from 'material-ui/transitions/Collapse'

class TblRow extends Component {

  constructor (props) {
    super(props)
    this.state = { expanded: false }
  }

  handleExpandClick = () => {
    this.setState({ expanded: !this.state.expanded })
  }

  render() {
    const item = this.props.item
    
    return (
      <TableRow onClick={this.handleExpandClick}>
        <TableCell>
          {(item['owlnames:label'] &&
            item['owlnames:label']['@value']) ||
            item['@id']}
          <Collapse in={this.state.expanded} timeout="auto" unmountOnExit>
            <p>
              {item['owlnames:synonym'] &&
              (
                'Synonym: ' +
                (Array.isArray(item['owlnames:synonym']) ?
                item['owlnames:synonym'].map((synonym, index) => {
                  return ' ' + synonym['@value']
                }) :
                item['owlnames:synonym']['@value'])
              )
              }
            </p>
            <p>
              {'Definition: ' +
              ((item['owlnames:definition'] && item['owlnames:definition']['@value']) || '')}
            </p>
          </Collapse>
        </TableCell>
      </TableRow>
    )
  }
}

export default TblRow
