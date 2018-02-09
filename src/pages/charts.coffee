import { _, React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
import drawer from 'data/ui/drawer'

{ div, span } = DOM

# import createPlotlyComponent from 'react-plotly.js/factory'
# Plot = createPlotlyComponent Plotly
import testData from './data/test'
# import Iframe from 'react-iframe'






data = [{
	type: 'scatter',
	mode: 'lines+points',
	x: [1, 2, 3],
	y: [2, 6, 3],
	marker:
		color: 'red'
	},{
		type: 'bar',
		x: [1, 2, 3],
		y: [2, 5, 3]
	}]
layout =
	width: 320,
	height: 240,
	title: 'A Fancy Plot'


d2 =
	data: []
	layout:
		title: 'Rectangle Positioned Relative to the Axes',
		width: 780,
		height: 600,
		# barmode: 'stack'
drawer.close()

console.log '---'
console.log testData

rectangleData = testData.assigned_spectrum.rectangle_data

export default createReactClass
	componentWillMount: ->
		drawer.setText 'Sample Chartz22332'
		drawer.close()

	componentDidMount: ->
		console.log 'ready to change the worlz2--'
		# console.log rectangleData

		newShapes = []
		data = []

		trace0 =
			type: 'bar'
			x: []
			y: []
			text: []
			width: []



		_.forEach rectangleData.mz_L, (el, key) ->
			# Fat
			# newShapes.push
			# 	type: 'rect'
			# 	x0: rectangleData.mz_left[key]
			# 	y0: rectangleData.bottom[key]
			# 	x1: rectangleData.mz_right[key]
			# 	y1: rectangleData.top[key]
			# 	text: "test-#{key}"
			# 	line:
			# 		color: 'rgba(165, 196, 170, 0.2)'
			# 		width: 1
			# 	fillcolor: 'rgba(165, 196, 170, 0.1)'

			# Slimshady
			width = (rectangleData.mz_R[key] - rectangleData.mz_L[key]) / 2
			center = rectangleData.mz_L[key] + width / 2
			newShapes.push
				type: 'rect'
				x0: rectangleData.mz_L[key]
				y0: rectangleData.bottom[key]
				x1: rectangleData.mz_R[key]
				y1: rectangleData.top[key]
				line: color: 'rgba(160, 34, 128, 0.7)'
				fillcolor: 'rgba(165, 196, 170, 0.1)'

			# Data fat
			width = (rectangleData.mz_right[key] - rectangleData.mz_left[key]) / 2
			center = rectangleData.mz_left[key] + width / 2
			trace0.x.push center
			trace0.y.push rectangleData.top[key]
			trace0.width.push width
			trace0.text.push  "test-#{key}"

		# trace1 =
		# 	type: 'bar'
		# 	x: []
		# 	y: []
		# 	width: []
		# _.forEach rectangleData.mz_L, (el, key) ->
		# 	trace1.x.push rectangleData.mz_left[key]
		# 	trace1.y.push rectangleData.top[key]
		# 	trace1.width.push 0.1



		# dw = 0.6
		# trace3 =
		# 	type: 'bar'
		# 	x: [1.1111,2]
		# 	y: [1,2]
		# 	width: [dw,dw]
		# 	text: ["test-1", "test-1"]

		# trace4 =
		# 	type: 'bar'
		# 	x: [1.1111,2]
		# 	y: [1,2]
		# 	width: [dw,dw]

		# trace77 =
		# 	type: 'scatter'
		# 	x: [1.1111,2]
		# 	y: [1,2]
		# 	width: [dw,dw]

		# trace5 =
		# 	type: 'bar'
		# 	x: [1,2]
		# 	y: [1,2]
		# 	width: [2*dw,2*dw]

		console.log '->>>', trace0
		# d2.data.push trace3
		# d2.data.push trace3
		# d2.data.push trace4
		d2.data.push trace0
		d2.layout.shapes = newShapes
		# d2.data.push trace5
		# d2.data.push trace0
		# d2.data.push trace1
		# d2.data.push trace1



		# d2.layout.shapes = newShapes
		# d2.layout.shapes = newShapes

		# # plot = generatePlot()
		# doc = new Bokeh.Document()
		# # console.log 'doc', doc
		# doc.add_root plot
		# div = document.getElementById('dupa')

		# Bokeh.embed.add_document_standalone doc, div


	render: ->
		e React.Fragment, {},
			div {}, 'dfgdfgdfg22'

			e Plot, {
				data: d2.data
				layout: d2.layout
				# layout: {barmode: 'stack'};
			}

			e Iframe, {
				width: '1200px'
				url: 'https://portal-new.mimuw.edu.pl/~matteo/mass_spectra/assigned_spectrum.html'
			}
