React = require 'react'
createReactClass = require 'create-react-class'
reactRedux = require 'react-redux'

# External imports
{ div, ul, li, h1, p, a, img, span, br } = React.DOM
jsfForm = React.createFactory require('react-jsonschema-form').default
typeAhead = React.createFactory require('react-bootstrap-typeahead').Typeahead

Button = React.createFactory require('material-ui/Button').default
Menu = React.createFactory require('material-ui/Menu').default
MenuItem = React.createFactory require('material-ui/Menu').MenuItem

Dialog = React.createFactory require('material-ui/Dialog').default
DialogTitle = React.createFactory require('material-ui/Dialog').DialogTitle
Typography = React.createFactory require('material-ui/Typography').default
TextField = React.createFactory require('material-ui/TextField').default

{ createStyleSheet, withStyles } = require 'material-ui/styles'

# Grid
Grid = React.createFactory require('material-ui/Grid').default

# SimpleDialog
{ blue } = require 'material-ui/colors'
styleSheet = createStyleSheet 'SimpleDialog232', ->
	avatar:
		background: blue[100]
		color: blue[600]


SimpleDialog = require('components/ConfigListDialog').default
SimpleDialogWrapped = React.createFactory withStyles(styleSheet)(SimpleDialog)

# Simple List Item
ListItem = require('components/ListItemMenu').default
ListItemStyleSheet = createStyleSheet 'ListStyle', (theme) ->
	root:
		width: '100%'
		maxWidth: '560px'
		background: theme.palette.background.paper
StyledListItem = React.createFactory withStyles(ListItemStyleSheet)(ListItem)



# My imports
dataReference = require 'data/jobs'
dl = require 'data/jobs'

schema = dataReference.schema.input
actionTypes = dataReference.actions.actionTypes

# My data
# uiSchema =
# 	distanceBetweenCharges:
# 		"ui:widget": "range"
uiSchema = {}

log = (type) =>
	console.log.bind console, type

# --- CONFIGS LIST ---
mapStateToProps = (state, ownProps) ->
	configs: state.configs
	files: state.userFiles

mapDispatchToProps = (dispatch, ownProps) ->

	submit: (result) ->
		console.log 'involve, create item: ', result

		console.log 'New test fun test lol'
		console.log '---', arguments
		console.log 'new: ', result.formData
		console.log 'props: ', ownProps

		if ownProps.onSuccessSubmit?
			ownProps.onSuccessSubmit()


		dispatch dl.actions.create result.formData

	onChange: (result) ->
		console.log 'inpute', result


module.exports = reactRedux.connect(mapStateToProps, mapDispatchToProps) createReactClass

	getInitialState: ->
		start =
			jobName: ''

			# Config
			open: false
			selectedConfig: false
			configKey: null

			# File
			selectedFile: false
			fileKey: null


	componentWillMount: ->
		console.log 'mount'

	saveJob: ->

		con = @props.configs[@state.configKey]
		job =
			name: @state.jobName
			config: con

		_.set job, "file.#{@state.fileKey}", true


		@props.onFullSubmit job



	render: ->
		jsProps =
			schema: schema
			uiSchema: uiSchema
			onChange: @props.onChange
			onSubmit: =>
				console.log 'saving form'
			onError: log 'errors'


		handleRequestClose = (value) =>
			if value?
				@setState
					selectedConfig: true
					configKey: value
					open: false
			else
				@setState
					selectedConfig: false
					configKey: value
					open: false

		selectFile = (key) =>
			console.log 'selectingFile', key
			@setState
				fileKey: key
				selectedFile: true

		getCurrentConfigName = =>
			el = @props.configs[@state.configKey]
			el.configName



		console.log 'all props', @props.files
		newFiles = _.forEach _.cloneDeep(@props.files), (e, k) ->
			e.key = k
			e.name = e.originalName


		div { className: @props.classes.root },
			Grid { container: true, gutter:40 },
				# Grid {item: true, xs: 12 },
				# 	jsfForm jsProps,
				# 		Button {
				# 			type: 'submit'
				# 			color: 'accent'
				# 			onClick: =>
				# 				console.log 'saving form'
				# 		}, 'Save Job forms'
				Grid {item: true, xs: 12 },
					Typography { type: 'display2' }, 'Create a new Job: '
				Grid {item: true, xs: 12 },
					Typography { type: 'title' }, 'SelectingFile: '
					StyledListItem {
						onSelect: (key) =>
							console.log 'selecting, key', key
							@setState
								fileKey: key
								selectedFile: true
						listData:
							label: 'Selected file for processing: '
							elements: newFiles
					}
					# StyledListItem {
					# 	data:
					# 		labelText: 'When bunny is a hero: '

					# }
				Grid {item: true, xs: 12 },
					TextField {
						id: "placeholder"
						label: "Job Name"
						type: "text"
						InputProps: placeholder: 'Your Job Name'
						# helperText: "Helper text"
						value: @state.jobName
						onChange: (e) =>
							@setState jobName: e.target.value
					}

				Grid {item: true, xs: 12 },
					Typography {
						type: 'subheading'
						onClick: =>
							@setState open: true
					},
						if @state.selectedConfig
							"Config: #{getCurrentConfigName()}"
						else
							"Please select config"
					# Config Selection
					Button {
						onClick: =>
							@setState open: true
					}, 'Open dialog'
					# Invisible
					SimpleDialogWrapped {
						selectedValue: @state.selectedValue
						open: @state.open
						onRequestClose: handleRequestClose
						data: @props.configs
					}
				Grid {item: true, xs: 12 },
					br {}
					br {}
					Button {
						color: 'accent'
						onClick: @saveJob
					}, 'Save Job final'
