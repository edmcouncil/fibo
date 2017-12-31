import React from 'react'
import IconSearch from 'material-ui/svg-icons/action/search'
import AutoComplete from 'material-ui/AutoComplete';

export class SearchBox extends React.Component {

  state = {
    searchText: 'Search',
  };

  handleUpdateInput = (searchText) => {
    this.setState({
      searchText: searchText,
    });
  };

  handleNewRequest = () => {
    this.setState({
      searchText: '',
    });
  };

  terms = [
      'Red',
      'Orange',
      'Yellow',
      'Green',
      'Blue',
      'Purple',
      'Black',
      'White',
    ]

  render () {
    return (
      <form onSubmit={this.handleSubmit}>
        <IconSearch />
        <AutoComplete
          hintText="Type 'r', case insensitive"
          searchText={this.state.searchText}
          onUpdateInput={this.handleUpdateInput}
          onNewRequest={this.handleNewRequest}
          dataSource={this.terms}
          filter={(searchText, key) => (key.indexOf(searchText) !== -1)}
          openOnFocus={true}
        />
      </form>
    )
  }
}

//export default (withStyles(styles)(SearchBox))
export default SearchBox
