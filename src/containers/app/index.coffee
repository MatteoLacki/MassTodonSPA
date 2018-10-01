import { React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import { withRouter }       from 'react-router'
import { MuiThemeProvider } from '@material-ui/core/styles'
import CssBaseline               from '@material-ui/core/CssBaseline';
import NavDrawer            from 'components/NavDrawer/frame.js'
import LoginForm            from 'components/LoginForm'

import auth                 from 'data/auth/state'
import theme                from './theme.coffee'

# Pages
# import jobs from 'containers/jobs'
import configs from 'pages/configs'
import files   from 'pages/files'
import jobs    from 'pages/jobs'
import charts  from 'pages/charts'
import config  from 'containers/config-form'

if process.env.REACT_APP_DEV
	MobxDevTools = require('mobx-react-devtools').default
# # hideLoader = require './loader'


export default withRouter mobxReact.observer createReactClass
	displayName: 'App'
	componentWillMount: -> auth.tryToLogin()
	render: ->
		console.log auth.state
		e React.Fragment, {},
			e CssBaseline, {}

			# Read if user is logged in or not
			if auth.state.isInitialUserStateLoaded
				e MuiThemeProvider, { theme: theme },
					if auth.state.isUserLoggedIn
						e NavDrawer, {},
							# e Route, { exact:true, path: '/', component: Dupa2}
							e Route, { exact:true, path: '/files',       component: files }
							# e Route, { exact:true, path: '/jobs',        component: jobs }
							e Route, { exact:true, path: '/configs',     component: configs }
							e Route, { exact:true, path: '/configs/add', component: config }
							e Route, { exact:true, path: '/charts',      component: charts }
					else
						e LoginForm, {
							actions:
								signInWithGoogle: -> auth.signInWithGoogle()
						}

					# --- DevBlock ---
					if process.env.REACT_APP_DEV then e MobxDevTools, {}
			else
				null
