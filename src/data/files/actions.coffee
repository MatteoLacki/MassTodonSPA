_ = require 'lodash'
uuid = require 'uuid/v4'

delay = (t, f) -> setTimeout f, t

{ firebaseDb, firebaseAuth, firebaseStorage } = require '../firebase'
fireFiles = firebaseDb.ref 'files'



fs = null
# DATA API
module.exports =
	actionTypes: actionTypes

	fetch: () ->
		(dispatch) ->

			return fs if fs?

			fs = new Promise (resolve, reject) ->
				firebaseAuth.onAuthStateChanged (user) ->
					if user?
						uid = user.uid
						ref = fireFiles.orderByChild('owner').equalTo uid

						ref.on 'value', (snapshot) ->
							console.log 'lol, FILLLE snapshot', snapshot
							dispatch
								type: actionTypes.fetched
								payload: snapshot.val()
							resolve()

	create: (fileRefence) ->
		(dispatch) ->
			uid = firebaseAuth.currentUser.uid

			originalName = fileRefence.name
			baseName = uuid()

			# Upload files
			ref = firebaseStorage.ref "spectro/#{uid}/#{baseName}"
			ref.put(fileRefence).then (snap) ->
				console.log 'uploade file', snap
				dispatch
					type: actionTypes.uploaded
					payload: {}

			.catch (e) ->
				console.log 'Uploadd failed', snap

			# Save to DB
			fireFiles.push
				owner: uid
				originalName: originalName
				baseName: baseName
