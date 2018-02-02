import { _, mobx } from 'app/react-tools'
{ observable, computed, action } = mobx
import { firebaseDb, firebaseAuth, firebaseStorage } from 'data/firebase'
import auth from 'data/auth/state'
uuid = require 'uuid/v4'

# Data
collection = firebaseDb.ref 'files'
store = observable
	data: observable {}
	loaded: false
	updateData: action (newData) ->
		_.merge store.data, newData
		console.log 'store', store.data

fs = null
API =
	store: store
	fetch: () ->
		return fs if fs?

		if auth.state.isUserLoggedIn
			fs = new Promise (resolve, reject) ->

				collection.orderByChild 'owner'
					.equalTo auth.state.uid
					.on 'value', (snapshot) ->
						console.log 'snapshot', snapshot.val()
						store.updateData snapshot.val()
						store.loaded = true
						resolve()

	create: (fileRefence) ->
		console.log 'ref: ', fileRefence
		console.log 'a', auth
		if auth.state.isUserLoggedIn

			# Random hash name
			baseName = uuid()

			# Upload files
			ref = firebaseStorage.ref "spectro/#{auth.state.uid}/#{baseName}"
			ref.put(fileRefence)
				.then (snap) -> console.log 'uploade file', snap
				.catch (e) ->   console.log 'Uploadd failed', snap

			# Save to DB
			collection.push
				owner: auth.state.uid
				originalName: fileRefence.name
				baseName: baseName



	remove: (key) ->
		console.log 'tyr to remove', key

export default API
