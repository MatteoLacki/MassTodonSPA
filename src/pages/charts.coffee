import { _, React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
import Plot from 'react-plotly.js';
{ div, span } = DOM
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';

import drawer from 'data/ui/drawer'

plotlyFromFile = require './orbi.json'
plotlyFromFile2 = require './test.json'



export default createReactClass
	getInitialState: -> return {} =
		tabValue: 0

	componentWillMount: ->
		drawer.setText 'Sample Chart'
		drawer.close()

	componentDidMount: ->
		console.log 'ready to change the charts'

	render: ->

		# Change Plotly Config
		plotlyFromFile.layout.autosize = true
		plotlyFromFile.useResizeHandler = true
		plotlyFromFile.style =
			width: '100%'
			height: '900px'



		# Which Plot to render
		PlotlyPlot = switch this.state.tabValue
			when 0 then e Plot, plotlyFromFile
			when 1 then e Plot, plotlyFromFile2


		# Render
		e React.Fragment, {},
			div {},
				e Tabs,
					value: this.state.tabValue
					onChange: (e, v) => this.setState tabValue: v
				,
					e Tab, label: 'HAHA1'
					e Tab, label: 'HAHA2'

			div {}, PlotlyPlot
