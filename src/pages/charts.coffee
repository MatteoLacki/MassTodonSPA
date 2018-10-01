import { _, React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
import drawer from 'data/ui/drawer'
import Plot from 'react-plotly.js';
{ div, span } = DOM



plotlyData =
	x: [1, 2, 3]
	y: [2, 6, 3]
	type: 'scatter'
	mode: 'lines+points'
	marker: {color: 'red'}

plotlyType =
	type: 'bar'
	x: [1, 2, 3]
	y: [2, 5, 3]



export default createReactClass
	componentWillMount: ->
		drawer.setText 'Sample Chart'
		drawer.close()

	componentDidMount: ->
		console.log 'ready to change the charts'




	render: ->

		plotlyConfig =
			data: [plotlyData, plotlyType]
			layout:
				title: 'A Fancy Plot'
				width: 720
				height: 440

		e React.Fragment, {},
			e Plot, plotlyConfig
