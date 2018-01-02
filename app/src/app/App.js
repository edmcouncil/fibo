import React from 'react'
import {red900} from 'material-ui/styles/colors';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
//import lightBaseTheme from 'material-ui/styles/baseThemes/lightBaseTheme';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
import 'typeface-roboto'
import Main from './Main'

const muiTheme = getMuiTheme({
  palette: {
    textColor: red900,
  }
})

const App = () => (
  <MuiThemeProvider muiTheme={getMuiTheme(muiTheme)}>
    <Main />
  </MuiThemeProvider>
);

export default App