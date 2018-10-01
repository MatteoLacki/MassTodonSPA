import { _, React, e, DOM } from 'app/react-tools'
import { Link } from 'react-router-dom'
import List from '@material-ui/core/List'
import { ListItem, ListItemIcon, ListItemText } from '@material-ui/core/List'
# Icons
import DashboardIcon     from '@material-ui/icons/Dashboard'
import CollectionsIcon   from '@material-ui/icons/Collections'
import AttachFileIcon    from '@material-ui/icons/AttachFile'
import BookmarkIcon      from '@material-ui/icons/Bookmark'
import PhotoIcon         from '@material-ui/icons/Photo'
import GroupIcon         from '@material-ui/icons/Group'
import InsertChartIcon   from '@material-ui/icons/InsertChart'
{ div, img, span, strong } = DOM


menuData =
	dashboard:
		uri: '/'
		label: 'Dashboard'
		icon: e DashboardIcon, {}
	jobs:
		uri: '/jobs'
		label: 'Jobs'
		icon: e PhotoIcon, {}
	configs:
		uri: '/configs'
		label: 'Configs'
		icon: e GroupIcon, {}
	files:
		uri: '/files'
		label: 'Files'
		icon: e AttachFileIcon, {}
	jobs:
		uri: '/jobs'
		label: 'Jobs'
		icon: e BookmarkIcon, {}
	charts:
		uri: '/charts'
		label: 'Test Chart'
		icon: e InsertChartIcon, {}


export default ->

	e List, {},
		_.map menuData, (el, key) ->
			e Link, { key: key,  to: el.uri },
				e ListItem, { button: true },
					e ListItemIcon, {}, el.icon
					e ListItemText, primary: el.label
