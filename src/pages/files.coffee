import { React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
import { Link } from 'react-router-dom'
import AddButton from 'components/FloatingAddButton'

import drawer from 'data/ui/drawer'
import component from 'containers/files'

export default createReactClass
	componentWillMount: -> drawer.setText 'Files'
	render: ->
		e React.Fragment, {},
			e component, {}
			e Link, { to:'/file/add' }, e AddButton
