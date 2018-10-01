import { createMuiTheme, createStyleSheet, MuiThemeProvider, withStyles } from '@material-ui/core/styles'
import { purple, green, red } from '@material-ui/core/colors'

theme = createMuiTheme
	palette:
		type: 'light'
		primary: red
		secondary: green
		error: red
	status:
		danger: 'orange'


export default theme
