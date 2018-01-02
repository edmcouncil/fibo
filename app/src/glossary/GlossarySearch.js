import React from 'react'
import IconSearch from 'material-ui/svg-icons/action/search'
//import ActionHighlightOff from 'material-ui/svg-icons/action/highlight-off'
import ContentClear from 'material-ui/svg-icons/content/clear'
import IconButton from 'material-ui/IconButton'
import AutoComplete from 'material-ui/AutoComplete';
import * as glossaryHelpers from './glossary-helpers'

export class GlossarySearch extends React.Component {

  constructor (props) {
    super(props)
    this.state = {
      searchTerms: props.sortedGlossary.map((item, index) => glossaryHelpers.termLabelOrId(item))
    }
  }

  handleNewRequest = (chosenRequest, index) => {
    this.setState({
      searchText: chosenRequest,
    });
    this.props.handleSearchInput(chosenRequest, index)
  };

  handleClear = (event) => {
    this.handleNewRequest('', 0)
  }

  render () {
    return (
      <div>
        <IconSearch style={{
          marginBottom: -5
        }} />
        <AutoComplete
          hintText="Search"
          searchText={this.state.searchText}
          //onUpdateInput={this.props.handleSearchInput}
          onNewRequest={this.handleNewRequest}
          dataSource={this.state.searchTerms}
          maxSearchResults={100}
          filter={(searchText, key) => (key.indexOf(searchText) !== -1)}
          openOnFocus={true}
        />
        <IconButton 
          disabled={false} 
          tooltip="Clear"
          onClick={this.handleClear}
          style={{
            top: 5,
            width: 24,
            height: 24,
            border: 0,
            padding: 0            
          }}
        >
          <ContentClear />
        </IconButton>
      </div>
    )
  }
}

export default GlossarySearch
