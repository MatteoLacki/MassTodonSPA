import { React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
import ConfigList from './list'

import configs from 'data/configs'

export default mobxReact.observer createReactClass
	componentWillMount: ->
		configs.fetch()

	render: ->
		if configs.store.loaded
			e ConfigList, {
				list: configs.store.data
				actions: delete: configs.remove
			}
		else
			null
