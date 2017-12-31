import React from 'react'
import TableRow, {TableCell} from 'material-ui/Table'

export default GlossaryRow = (props) => (

  //console.log('TblRow item ' + item.index)
    
  <TableRow {...props}>
    <TableCell>
      {
        (
          props.item['owlnames:label'] &&
          props.item['owlnames:label']['@value']
        ) || props.item['@id']
      }
      <p>
        {
          props.item['owlnames:synonym'] && (
            'Synonym: ' + (
              Array.isArray(props.item['owlnames:synonym']
            ) ?
            props.item['owlnames:synonym'].map(
              (synonym, index) => {
                return ' ' + synonym['@value']
              }
            ) :
            props.item['owlnames:synonym']['@value'])
          )
        }
      </p>
      <p>
        {
          'Definition: ' + (
            (props.item['owlnames:definition'] && props.item['owlnames:definition']['@value']) || ''
          )
        }
      </p>
    </TableCell>
  </TableRow>
)
GlossaryRow.muiName = 'TableRow'
