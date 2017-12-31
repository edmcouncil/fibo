import React, { Component } from 'react'
import logo from './fibo-logo.png'
import './Main.css'
import SearchBox from './SearchBox'
import GlossaryTable from './GlossaryTable'
import unsortedGlossary from './data/test-glossary.json'

class Main extends Component {

  constructor (props) {
    super(props)
    this.state = {searchTerm: '', sortedGlossary: this.sortGlossary(unsortedGlossary)}
  }

  componentDidMount() {
    console.log('componentDidMount')
  }

  handleSearchInput(e) {
    this.setState({searchTerm: e.target.value})
  }

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
      <div id='main' className='Main'>
        <header className='Main-header'>
          <img src={logo} className='Main-logo' alt='logo' />
          <h1 className='Main-title'>FIBO Glossary</h1>
        </header>
        <SearchBox />
        {(() => {
          if (this.state.sortedGlossary == null) {
            return (
              <div>Loading</div>
            )
          } else {
            return (
              <GlossaryTable sortedGlossary={this.state.sortedGlossary} />
            )
          }
        })()}
      </div>
    );
  }
}
export default Main