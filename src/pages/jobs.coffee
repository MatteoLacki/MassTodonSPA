import { React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
import { Link } from 'react-router-dom'
import AddButton from 'components/FloatingAddButton'

import drawer from 'data/ui/drawer'
import component from 'containers/jobs'

import jobDescription from 'components/PaperText'
import Grid from '@material-ui/core/Grid'

{ div, h1, p, a, img, span, ul, li } = DOM


export default mobxReact.observer createReactClass
	componentWillMount: -> drawer.setText 'Jobs'
	render: ->
		e React.Fragment, {},

			e Grid, { container: true, gutter:24 },
				e Grid, { item: true, xs:12 },
					e jobDescription, {
						header: 'A List of jobs.'
						body: 'Here are all your jobs with files etc.'
					}
			e Grid, { container: true, gutter:40 },
				e Grid, { item: true, xs:12 },
					e component, {}


			e Link, { to:'/jobs/add' }, e AddButton





# Button = React.createFactory require('@material-ui/core/Button').default
# # Avatar = React.createFactory require('@material-ui/core/Avatar').default
# # PersonIcon = React.createFactory require('@material-ui/icons/Person').default
# AddIcon = React.createFactory require('@material-ui/icons/Add').default


# # Default Grid
# Grid = React.createFactory require('@material-ui/core/Grid').default
# { createStyleSheet, withStyles } = require '@material-ui/core/styles'
# gridStyle = createStyleSheet 'FullGrid', (theme) ->
# 	root:
# 		flexGrow: 1
# 		marginTop: 30

# module.exports = withStyles(gridStyle) createReactClass

# 	render: ->

# 		# div {className: @props.classes.root },
# 		e React.Fragment, {},
# 			e Grid, { container: true, gutter:24 },
# 				e Grid, { item: true, xs:12 },
# 					jobDescription {
# 						header: 'A List of jobs.'
# 						body: 'Here are all your jobs with files etc.'
# 					}
# 			e Grid, { container: true, gutter:40 },
# 				e Grid, { item: true, xs:12 },
# 					jobs {}


# # jobDescription = React.createFactory require './jobs.rt'
