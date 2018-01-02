import React from 'react'
import Highlighter from 'react-highlighter'
import {Card, CardHeader, CardText} from 'material-ui/Card'
import Drawer from 'material-ui/Drawer'
import ContentClear from 'material-ui/svg-icons/content/clear'
import TextField from 'material-ui/TextField'
import * as glossaryHelpers from './glossary-helpers'

class GlossaryCardDrawer extends React.Component {

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

class Glossary extends React.Component {
  
  constructor(props) {
    super(props)
    this.state = {
      searchTerm: props.searchTerm,
      selectedTermIndex: -1,
      filterSearchResults: false,
      selectedItem: null
    }
  }

  handleCardClick = (event, item, index) => {
    // console.log("handleCardClick: ")
    // console.dir(event)
    // console.log('this is:', this)
    console.log('item: ', item)
    // console.log('index:', index)
    this.setState({
      selectedItem: this.state.selectedItem === item ? null : item
    })
  }

  filteredGlossaryItems = () => {
    if (this.state.searchTerm === '' || this.state.filterSearchResults === false) {
      return (
        this.props.sortedGlossary
      )
    } else {
      return (
        this.props.sortedGlossary.filter(item =>
          glossaryHelpers.termLabelOrId(item).indexOf(this.state.searchTerm) !== -1
        )
      )
    }
  }

  glossaryCards = () => this.filteredGlossaryItems().map(this.rowFunction)

  rowFunction = (item, index) => {
    return (
      <Card key={index} style={{paddingLeft: 7}} onClick={(e) => this.handleCardClick(e, item, index)}>
        <CardHeader
          title={
            <Highlighter 
              search={this.state.searchTerm} 
              matchStyle={{ backgroundColor: 'yellow' }}
            >
              {glossaryHelpers.termLabelOrId(item)}
            </Highlighter>
          }
          subtitle={glossaryHelpers.termDefinition(item)}
          actAsExpander={true}
          showExpandableButton={glossaryHelpers.termHasSynonym(item)}
        />
        {glossaryHelpers.termHasSynonym(item) ? 
          <CardText expandable={false}>
          {glossaryHelpers.termSynonymWithLabel(item)}
          </CardText> : ''
        }
      </Card>
    )
  }

  shouldRender = () => Array.isArray(this.props.sortedGlossary) && this.props.sortedGlossary.length > 0

  renderIfEmpty = () => <div>No Glossary</div>

  renderIfNotEmpty = () => (
    <div>
      {this.glossaryCards()}
      <GlossaryCardDrawer item={this.state.selectedItem}/>
    </div>
  )

  render() {
    return this.shouldRender() ? this.renderIfNotEmpty() : this.renderIfEmpty()
  }
}

export default Glossary