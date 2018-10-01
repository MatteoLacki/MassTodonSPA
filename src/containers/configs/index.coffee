import { _, React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
{ div, ul, li, h1, p, a, img, span, br } = DOM
# import ConfigList from './list'
import ConfigCard from 'components/ConfigCard'
import configs from 'data/configs'
styles = require './index.styl'


export default mobxReact.observer createReactClass
	componentWillMount: ->
		configs.fetch()

	render: ->


		console.log 'Configs Data', configs
		_.map configs.list, (el, key) ->
			console.log('-->', el, key)
		console.log 'start render'
		console.log 'Component', ConfigCard



		if configs.store.loaded

			e React.Fragment, {},
				div { className: styles.default },
					_.map configs.store.data, (config, key) ->
						div { key: key },
							e ConfigCard,
								data: config
								name: config.configName
								actions:
									delete: (event) ->
										console.log('kill, config', event)
										#props.actions.delete(key)

		else
			null
	