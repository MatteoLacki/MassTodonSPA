{ _, React, createReactClass, reactRedux, DOM, e, cx } = require 'app/react-tools'


# Dom
{ div, ul, li, h1, p, a, img, span } = DOM
Paper = require('@material-ui/core/Paper').default
Button = require('@material-ui/core/Button').default
Typography = require('@material-ui/core/Typography').default
LinearProgress = require('@material-ui/core/Progress/LinearProgress').default

CloudUploadIcon = require('material-ui-icons/CloudUpload').default
EditIcon = require('material-ui-icons/Edit').default

Dropzone = require 'react-dropzone'
# DropContent = React.createFactory require('./content').default

styles = require './index.styl'

module.exports = createReactClass
	getInitialState: -> return {} =
		files: []
		dropzoneActive: false
		imageUri: ''
		hasImage: false

		uploadInProgress: false
		progress: 0


	onDragEnter: ->
		@setState dropzoneActive: true

	componentDidMount: ->
		if @props.overlay
			@setState dropzoneActive: true
		else
			@setState dropzoneActive: false

		if @props.imageUri
			@setState
				imageUri: @props.imageUri
				hasImage: true

	onDragLeave: -> @setState dropzoneActive: false
	onDrop: (files) ->
		@setState
			files: files
			imgFile: files[0]
			dropzoneActive: false
			uploadInProgress: true
			progress: 0

		file = files[0]
		if @props.upload
			myUpload = @props.upload file
			console.log 'laoding ', myUpload
			myUpload.catch (e) ->
				console.log 'upload failed, ', e

			myUpload.then (rez) =>
				@setState
					uploadInProgress: false
					imageUri: rez.downloadURL
					hasImage: true


			myUpload.on 'state_changed', (snap) =>
				progress = Math.round ((snap.bytesTransferred / snap.totalBytes) * 100)
				if progress == 100
					progress = 99
				@setState progress: progress





	render: ->


		div { className: styles.default },
			e Dropzone, {
				style: {}
				onDragEnter: @onDragEnter
				onDragLeave: @onDragLeave
				onDrop: @onDrop
			},
				div { className: 'dropBox' },

					if @state.dropzoneActive
						div { className: 'overlay'}

					if @state.uploadInProgress
						div {className: 'uploadProgress'},
							e LinearProgress, { className: 'bar', mode: "determinate", value: @state.progress }

					if @props.label?
						div { className: 'imageTypeLabel' },
							span {}, @props.label


					if @state.hasImage
						div { className: 'editIcon' },
							e Button, { fab:true, color: 'primary' },
								e EditIcon, {}

					if @state.hasImage
						div { className: 'dropzoneWithImage' },
							e Paper, { className: 'loadedImage' },
								img { src: @state.imageUri  }
					else
						div { className: 'dropzoneEmpty' },
							e Paper, { className: 'content' },
								if !@state.uploadInProgress
									e Button, { fab: true, color: 'primary' },
										e CloudUploadIcon, {}
								else
									null
