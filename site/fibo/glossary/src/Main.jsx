import React, { Component } from 'react'
import logo from './fibo-logo.png'
import './Main.css'
import Table, { TableBody } from 'material-ui/Table'
import TblRow from './TblRow'
import SearchBox from './SearchBox'
import glossary from './data/test-glossary.json'

class Main extends Component {
  constructor (props) {
    super(props)
    this.state = {searchTerm: ''}
  }

  handleSearchInput(e) {
    this.setState({searchTerm: e.target.value})
  }

  render() {
    const sortFunction = (a,b) => {
      
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
    const sortedGlossary = glossary.sort(sortFunction)

    return (
      <div id="main" className='Main'>
        <header className='Main-header'>
          <img src={logo} className='Main-logo' alt='logo' />
          <h1 className="Main-title">FIBO Glossary</h1>
        </header>
        <SearchBox />
        <Table>
          <TableBody>
            {sortedGlossary.map((item, index) => {
              return (
                <TblRow id={index} item={item} />
              )
            })}
          </TableBody>
        </Table>
      </div>
    );
  }
}

export default Main
