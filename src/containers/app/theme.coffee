import { createMuiTheme, createStyleSheet, MuiThemeProvider, withStyles } from 'material-ui/styles'

import { purple, green, red } from 'material-ui/colors'

theme = createMuiTheme
	palette:
		type: 'light'
		primary: red
		secondary: green
		error: red
	status:
		danger: 'orange'


export default theme
