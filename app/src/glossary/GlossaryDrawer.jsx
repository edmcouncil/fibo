import React from 'react'
import {Card, CardHeader, CardTitle, CardText} from 'material-ui/Card'
import Divider from 'material-ui/Divider'
import Drawer from 'material-ui/Drawer'
import ContentClear from 'material-ui/svg-icons/content/clear'
import * as glossaryHelpers from './glossary-helpers'

const itemFieldTitleStyle = {
  fontSize: 14, 
  fontWeight: "bold"
}

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
        <Divider />
        <CardTitle title="ID" titleStyle={itemFieldTitleStyle} />
        <CardText>{glossaryHelpers.termId(this.props.item)}</CardText>
        <CardTitle title="Logical Definition" titleStyle={itemFieldTitleStyle} />
        <CardText>{glossaryHelpers.termLogicalDefinitionNoBreaks(this.props.item)}</CardText>
        <CardTitle title="Synonyms" titleStyle={itemFieldTitleStyle} />
        <CardText>
        <ul>
          {
            glossaryHelpers.termSynonymArray(this.props.item).forEach(
              (synonym) => (
                <li>{synonym}</li>
              )
            )
          }
        </ul>
        </CardText>

        

        <CardTitle title="Kind Of" titleStyle={itemFieldTitleStyle} />
        <CardText>
        <ul>
          {
            glossaryHelpers.termSynonymArray(this.props.item).forEach(
              (synonym) => (
                <li>{synonym}</li>
              )
            )
          }
        </ul>
        </CardText>
      </Card>
    </Drawer>
  )

  render() {
    return this.isItemSelected() ? this.renderIfNotEmpty() : this.renderIfEmpty()
  }
}

export default GlossaryDrawer