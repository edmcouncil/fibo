import React, { Component } from 'react'
import Glossary from '../glossary/Glossary'
import Toolbar from './Toolbar'
import unsortedGlossary from '../data/test-glossary.json'

class Main extends Component {

  constructor (props) {
    super(props)
    this.state = {searchTerm: '', sortedGlossary: this.sortGlossary(unsortedGlossary)}
  }

  handleSearchInput = (searchTerm) => {
    console.log('Search Term: ' + searchTerm)
    this.setState({
      searchTerm: searchTerm
    })
  };

  sortFunction = (a,b) => {
    let nameA = ((a['owlnames:label'] && a['owlnames:label']['@value']) || a['@id']).toUpperCase()
    let nameB = ((b['owlnames:label'] && b['owlnames:label']['@value']) || b['@id']).toUpperCase()
    
    if (nameA < nameB) {
      return -1
    }
    if (nameA > nameB) {
      return 1
    }
    return 0
  }

  sortGlossary(unsortedGlossary_) {
    unsortedGlossary_.sort(this.sortFunction)
    //
    // unsortedGlossary_ is now sorted, add/update the index in each item
    //
    unsortedGlossary_.forEach(
      (item, index) => {
        item.index = index
      }
    )
    return unsortedGlossary_
  }

  render() {

    return (
      <div>
        <Toolbar
          sortedGlossary={this.state.sortedGlossary} handleSearchInput={this.handleSearchInput}
        />
        <Glossary 
          sortedGlossary={this.state.sortedGlossary} searchTerm={this.state.searchTerm}
        />
      </div>
    );
  }
}
export default Main