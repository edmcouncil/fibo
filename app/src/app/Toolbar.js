import React from 'react'
import IconMenu from 'material-ui/IconMenu'
import IconButton from 'material-ui/IconButton'
import NavigationExpandMoreIcon from 'material-ui/svg-icons/navigation/expand-more'
import MenuItem from 'material-ui/MenuItem'
import DropDownMenu from 'material-ui/DropDownMenu'
import Divider from 'material-ui/Divider';
import {Toolbar as MuiToolbar, ToolbarGroup, ToolbarSeparator} from 'material-ui/Toolbar'
import GlossarySearch from '../glossary/GlossarySearch'
import logo from './fibo-logo.png'

export default class Toolbar extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      value: 3,
    }
  }

  handleChange = (event, index, value) => this.setState({value})

  render() {
    return (
      <MuiToolbar>
        <ToolbarGroup firstChild={true}>
          <DropDownMenu 
            value={this.state.value} 
            onChange={this.handleChange}
            autoWidth={false}
            width="400px"
          >
            <MenuItem value={1} primaryText="FIBO Home" />
            <Divider />
            <MenuItem value={2} primaryText="FIBO Ontology" disabled />
            <MenuItem value={3} primaryText="FIBO Glossary" />
            <MenuItem value={4} primaryText="FIBO Vocabulary" disabled />
            <MenuItem value={5} primaryText="FIBO Dictionary" disabled />
            <MenuItem value={6} primaryText="FIBO Widoco" disabled />
            <MenuItem value={7} primaryText="FIBO schema.org" disabled />
            <Divider />
            <img src={logo} className='Main-logo' alt='logo' 
              style={{
                marginLeft: "20px"
              }}
            />
          </DropDownMenu>
        </ToolbarGroup>
        <ToolbarGroup>
          <GlossarySearch sortedGlossary={this.props.sortedGlossary} handleSearchInput={this.props.handleSearchInput} />
          <ToolbarSeparator/>
          <IconMenu
            iconButtonElement={
              <IconButton touch={true}>
                <NavigationExpandMoreIcon />
              </IconButton>
            }
          >
            <MenuItem primaryText="Download" />
            <MenuItem primaryText="More Info" />
          </IconMenu>
        </ToolbarGroup>
      </MuiToolbar>
    )
  }
}