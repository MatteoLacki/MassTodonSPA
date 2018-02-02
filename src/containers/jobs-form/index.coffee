React = require 'react'
createReactClass = require 'create-react-class'
reactRedux = require 'react-redux'

# DOM
{ div, ul, li, h1, p, a, img, span, br } = React.DOM
jobForm = React.createFactory require './form'
ProgressBar = React.createFactory require('components/LiniarProgressBar').default

# My imports
dataReference = require 'data/jobs'

files = require 'data/files'
configs = require 'data/configs'

actionTypes = dataReference.actions.actionTypes

# --- CONFIGS LIST ---
mapStateToProps = (state, ownProps) ->
	jobs: state.jobs

mapDispatchToProps = (dispatch, ownProps) ->

	fetchAllData: () ->
		Promise.all([
			dispatch files.actions.fetch()
			dispatch configs.actions.fetch()
		]).then ->
			console.log 'data loaded'

	submit: (result) ->
		console.log 'super rez:', result
		# console.log 'involve, create item: ', result

		# console.log 'New test fun test lol'
		# console.log '---', arguments
		# console.log 'new: ', result.formData
		# console.log 'props: ', ownProps

		if ownProps.onSuccessSubmit?
			ownProps.onSuccessSubmit()


		dispatch dataReference.actions.create result

	onChange: (result) ->
		console.log 'inpute', result



{ createStyleSheet, withStyles } = require 'material-ui/styles'
gridStyle = createStyleSheet 'FullGrid', (theme) ->
	root:
		flexGrow: 1
		marginTop: 30

styledJobForm = React.createFactory withStyles(gridStyle)(jobForm)

module.exports = reactRedux.connect(mapStateToProps, mapDispatchToProps) createReactClass

	getInitialState: ->
		start =
			isDataLoaded: false

	componentWillMount: ->
		@props.fetchAllData().then =>
			@setState
				isDataLoaded: true


	render: ->

		# DOM
		div {},
			if @state.isDataLoaded
				styledJobForm { onFullSubmit: @props.submit }
			else
				ProgressBar {}
