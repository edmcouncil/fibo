import React, { Component } from 'react'
import logo from './logo.svg'
import './App.css'
import 'typeface-roboto'
import glossary from './data/glossary.json'
import Table, { TableBody } from 'material-ui/Table'
import TblRow from './TblRow'
import SearchBox from './SearchBox'

class App extends Component {
  constructor (props) {
    super(props)
    this.state = {searchTerm: ''}
  }

  handleSearchInput = (e) => {
    this.setState({searchTerm: e.target.value})
  }

  render() {
    const sortedGlossary = glossary.sort((a,b) => {
      let nameA = ((a['owlnames:label'] && a['owlnames:label']['@value']) || a['@id']).toUpperCase()
      let nameB = ((b['owlnames:label'] && b['owlnames:label']['@value']) || b['@id']).toUpperCase()
      if (nameA < nameB) {
        return -1;
      }
      if (nameA > nameB) {
        return 1;
      }
    })

    return (
      <div className='App'>
        <header className='App-header'>
          <img src={logo} className='App-logo' alt='logo' />
          <h1 className="App-title">Welcome to React</h1>
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

export default App
