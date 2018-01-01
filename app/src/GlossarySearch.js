import React from 'react'
import IconSearch from 'material-ui/svg-icons/action/search'
import AutoComplete from 'material-ui/AutoComplete';
import * as glossaryHelpers from './glossary-helpers'

export class GlossarySearch extends React.Component {

  constructor (props) {
    super(props)
    this.state = {
      searchTerms: props.sortedGlossary.map((item, index) => glossaryHelpers.termLabelOrId(item))
    }
  }

  handleNewRequest = () => {
    this.setState({
      searchText: '',
    });
  };

  render () {
    return (
      // <form onSubmit={this.handleSubmit}>
      <div>
        <IconSearch />
        <AutoComplete
          hintText="Search"
          searchText={this.state.searchText}
          onUpdateInput={this.props.handleSearchInput}
          onNewRequest={this.handleNewRequest}
          dataSource={this.state.searchTerms}
          maxSearchResults={100}
          filter={(searchText, key) => (key.indexOf(searchText) !== -1)}
          openOnFocus={true}
        />
      </div>
    )
  }
}

export default GlossarySearch
