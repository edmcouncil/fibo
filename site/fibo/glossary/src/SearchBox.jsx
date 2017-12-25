import PropTypes from 'prop-types'
import React from 'react'
import { withStyles } from 'material-ui/styles'
import Input from 'material-ui/Input'
import IconSearch from 'material-ui-icons/Search'
import classnames from 'classnames'

const styles = theme => ({
  searchBox: {
    // TODO: Get highlights from from theme
    backgroundColor: theme.palette.background.default,
    display: 'flex',
    borderRadius: '2px',
    alignItems: 'center',
    '&:hover': {
      backgroundColor: theme.palette.background.appBar
    }
  },
  searchInput: {
    width: '100%',
    color: theme.palette.text.primary,
    paddingRight: '10px',
    transition: '.25s'
  },
  // TODO: Pretty sure this could be done in a smarter way within the searchInput class
  searchInputExpanded: {
    width: '100%'
  },
  searchIcon: {
    paddingLeft: '20px',
    paddingRight: '20px'
  }
})

export class SearchBox extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      expanded: false,
      searchTerm: ''
    }
  }

  toggleExpanded = () => {
    this.setState({expanded: !this.state.expanded})
  }

  handleInput = (e) => {
    this.setState({searchTerm: e.target.value})
  }

  handleSubmit = (e) => {
    this.props.sendSearchTerm(this.state.searchTerm)
    this.setState({searchTerm: ''})
    e.preventDefault()
  }

  render () {
    const classes = this.props.classes
    let classNames = classnames(classes.searchInput, { [classes.searchInputExpanded]: this.state.expanded })

    return (
      <form onSubmit={this.handleSubmit} className={classes.searchBox}>
        <IconSearch className={classes.searchIcon} />
        <Input
          className={classNames}
          disableUnderline
          onFocus={this.toggleExpanded}
          onBlur={this.toggleExpanded}
          onInput={this.handleInput}
          value={this.state.searchTerm} />
      </form>
    )
  }
}

export default (withStyles(styles)(SearchBox))
