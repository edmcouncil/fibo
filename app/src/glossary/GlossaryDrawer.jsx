import React from 'react'
import {Card, CardHeader, CardText} from 'material-ui/Card'
import Drawer from 'material-ui/Drawer'
import ContentClear from 'material-ui/svg-icons/content/clear'
import TextField from 'material-ui/TextField'
import * as glossaryHelpers from './glossary-helpers'

class GlossaryDrawer extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      open: true
    }
  }

  handleDrawerClose = () => {
    this.setState({
      open: false
    })
  }

  isItemSelected = () => this.props.item !== undefined && this.props.item !== null

  renderIfEmpty = () => <span/>

  renderIfNotEmpty = () => (
    <Drawer
      width={400} 
      openSecondary={true} 
      open={this.state.open} 
      zDepth={5} 
      containerStyle={{
        top: 64, 
        height: 'calc(100% - 128px)'
      }}
    >
      <ContentClear
        style={{
          cursor:'pointer', 
          float:'right', 
          marginTop: '5px', 
          width: '20px'
        }} 
        onClick={this.handleDrawerClose}
      />
      <Card>
        <CardHeader
          title={glossaryHelpers.termLabelOrId(this.props.item)}
          subtitle={glossaryHelpers.termDefinition(this.props.item)}
          actAsExpander={true}
          showExpandableButton={glossaryHelpers.termHasSynonym(this.props.item)}
        />
        <CardText>
        <TextField
            defaultValue={glossaryHelpers.termId(this.props.item)}
            floatingLabelText="ID"
          /><br />
        {glossaryHelpers.termHasSynonym(this.props.item) ? 
          <span>
          <TextField
            defaultValue={glossaryHelpers.termSynonym(this.props.item)}
            floatingLabelText="Synonym(s)"
          /><br /></span>
           : ''
        }
        </CardText>
      </Card>
    </Drawer>
  )

  render() {
    return this.isItemSelected() ? this.renderIfNotEmpty() : this.renderIfEmpty()
  }
}

export default GlossaryDrawer