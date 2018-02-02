import { React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
{ firebase, firebaseAuth, firebaseDb, firebaseStorage } = require 'data/firebase'
import {observer} from "mobx-react"

import dropzone from 'react-dropzone'
import files from 'data/files'
{ div, ul, li, h1, p, a, img, span } = DOM

mapper = observer createReactClass
	render: ->
		ul {},
			_.map @props.files, (item, key) =>
				li {key: key}, "#{item.originalName}"

export default observer createReactClass

	componentWillMount: -> files.fetch()
	saveFile: (binaries) ->
		if firebaseAuth.currentUser?
			binaries.forEach (f) ->
				files.create f

	render: ->
		div {},
			e dropzone, onDrop: @saveFile
			if files.store.loaded
				e mapper, {files: files.store.data}
		