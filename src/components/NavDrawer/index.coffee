{ _, React, createReactClass, reactRedux, e, DOM } = require 'app/react-tools'
{ div, img, span, strong } = DOM

{ observable, computed, action } = require 'mobx'
{ observer } = require 'mobx-react'

classNames = require 'classnames'

# AppBar
MyAppBar   = require 'containers/app-bar'
Paper      = require('material-ui/Paper').default
AppBar     = require('material-ui/AppBar').default
Toolbar    = require('material-ui/Toolbar').default
Button     = require('material-ui/Button').default
IconButton = require('material-ui/IconButton').default

# Drawer
Drawer       = require('material-ui/Drawer').default
List         = require('material-ui/List').default
Divider      = require('material-ui/Divider').default
List         = require('material-ui/List').default

ListItem     = require('material-ui/List/ListItem').default
ListItemText = require('material-ui/List/ListItemText').default
ListItemIcon = require('material-ui/List/ListItemIcon').default


# Icons
MenuIcon        = require('material-ui-icons/Menu').default
ArrowBackIcon   = require('material-ui-icons/ArrowBack').default
FilterListIcon  = require('material-ui-icons/FilterList').default
ChevronLeftIcon = require('material-ui-icons/ChevronLeft').default



MenuContent = require './menu-content'

# styles = require './index.styl'

ui = require 'data/ui/drawer'
MiniDrawer = observer createReactClass
	displayName: 'MiniDrawer'

	render: ->
		{ actions, show, classes } = @props
		div { className: classes.root },
			div { className: classes.appFrame },
				e MyAppBar, {}

				e Drawer, {
					type: 'permanent'
					classes:
						paper: classNames classes.drawerPaper, !ui.open && classes.drawerPaperClose
					open: ui.open
				},
					div { className: classes.drawerInner },
						div { className: classes.drawerHeader },
							e IconButton, { onClick: -> ui.close() },
								e ChevronLeftIcon
						e Divider, {}
						e MenuContent, {}
				div { className: classes.content },
					@props.children



moreStyles = (theme) ->
	drawerWidth = 240

	return
		root:
			width: '100%'
			height: '100%'
			# marginTop: theme.spacing.unit * 3
			zIndex: 1
			overflow: 'hidden'
		appFrame:
			position: 'relative'
			display: 'flex'
			width: '100%'
			height: '100%'
		appBar:
			position: 'absolute'
			zIndex: theme.zIndex.navDrawer + 1
			transition: theme.transitions.create([
				'width'
				'margin'
			],
				easing: theme.transitions.easing.sharp
				duration: theme.transitions.duration.leavingScreen)
		appBarShift:
			marginLeft: drawerWidth
			width: "calc(100% - #{drawerWidth}px)"
			transition: theme.transitions.create([
				'width'
				'margin'
			],
				easing: theme.transitions.easing.sharp
				duration: theme.transitions.duration.enteringScreen)
		menuButton:
			marginLeft: 12
			marginRight: 36
		hide: display: 'none'
		drawerPaper:
			position: 'relative'
			height: '100%'
			width: drawerWidth
			transition: theme.transitions.create('width',
				easing: theme.transitions.easing.sharp
				duration: theme.transitions.duration.enteringScreen)
		drawerPaperClose:
			width: 60
			overflowX: 'hidden'
			transition: theme.transitions.create('width',
				easing: theme.transitions.easing.sharp
				duration: theme.transitions.duration.leavingScreen)
		drawerInner:
			width: drawerWidth
			overflow: 'hidden'
			height: '100vh'
		drawerHeader: _.assign {}, {
			display: 'flex'
			alignItems: 'center'
			justifyContent: 'flex-end'
			padding: '0 8px'
			height: 64
			},
				theme.mixins.toolbar
		content:
			width: '100%'
			flexGrow: 1
			backgroundColor: theme.palette.background.default
			padding: 24
			height: 'calc(100% - 56px)'
			marginTop: 56
			"#{theme.breakpoints.up('sm')}":
				height: 'calc(100% - 64px)'
				marginTop: 64


{ withStyles } = require 'material-ui/styles'

module.exports = withStyles(moreStyles) MiniDrawer
