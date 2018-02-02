_                  = require 'lodash'
React              = require 'react'
createReactClass   = require 'create-react-class'
reactRedux         = require 'react-redux'
{ createSelector } = require 'reselect'

# My imports
{ selectors, actions } = require 'data/jobs'

# Dom
JobsList             = React.createFactory require('components/JobsList').default
CircularLoader       = React.createFactory require('components/CircularLoader').default
Grid                 = React.createFactory require('material-ui/Grid').default
SimpleJobDescription = React.createFactory require('components/PaperText').default

{ div, ul, li, h1, p, a, img, span } = React.DOM
{ createStyleSheet, withStyles } = require 'material-ui/styles'
Highcharts = require 'highcharts'
require('highcharts/modules/exporting')(Highcharts)


# Default Grid
gridStyle = createStyleSheet 'FullGrid', (theme) ->
	root:
		flexGrow: 1
		marginTop: 30

# --- CONFIGS LIST ---
mapStateToProps = (state, ownProps) ->
	items: selectors.getHappyJobs state

mapDispatchToProps = (dispatch, ownProps) ->
	fetch: ->
		Promise.all([
			dispatch actions.fetch()
		]).catch (e) ->
			console.log 'failed to load jobs'

	fetchResult: ->
		dispatch actions.downloadResult ownProps.itemKey


# Charts test
data = require './data'
chart1 = require './chart-1.coffee'


module.exports = reactRedux.connect(mapStateToProps, mapDispatchToProps) withStyles(gridStyle) createReactClass
	getInitialState: -> return {} =
		isDataLoaded: false
		drawChart: false
		item: {}

	componentWillMount: ->
		@props.fetch().then =>
			# Mark data as loaded for render
			@setState
				isDataLoaded: true
				item: @props.items[@props.itemKey]

			@props.fetchResult().then =>
				@setState drawChart: true

				latestJobData = @props.items[@props.itemKey]
				console.log 'data', latestJobData
				# Chart 1
				fullChart = chart1 latestJobData.data1

				console.log 'FULL CHART ', fullChart
				setTimeout ->
					Highcharts.chart 'sampleChart', fullChart
					console.log 'test'
				, 300






	# Hackish way to show highcharts data
	componentDidUpdate: (prevProps, prevState) ->
		# if prevState.isDataLoaded == false
		# 	setTimeout ->
		# 		Highcharts.chart 'sampleChart', data
		# 		console.log 'test'
		# 	, 300

	render: ->
		console.log 'this props22', @props
		console.log 'this props2222', @state


		if @state.isDataLoaded
			Grid {
				className: @props.classes.root
				container: true
				direction: 'column'
				justify: 'flex-start'
				align: 'stretch'
			},
				Grid { item: true, xs:11 },
					SimpleJobDescription {
						header: @state.item.label
						body: @state.item.secondary
					}
				Grid { item: true, xs:11 },
					div { id: 'sampleChart' }, 'sample'
		else
			CircularLoader {}
