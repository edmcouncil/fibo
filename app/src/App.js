import React from 'react'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
import 'typeface-roboto'
import Main from './Main'

const App = () => (
  <MuiThemeProvider>
    <Main />
  </MuiThemeProvider>
);

export default App