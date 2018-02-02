import { _, mobx } from 'app/react-tools'
{ observable, computed, action } = mobx
import { firebaseDb, firebaseAuth } from 'data/firebase'
import auth from 'data/auth/state'

# Data
collection = firebaseDb.ref 'configs'
store = observable
	data: {}
	loaded: false
	updateData: action (newData) ->
		_.merge store.data, newData

fs = null
API =
	store: store
	fetch: () ->
		return fs if fs?

		fs = new Promise (resolve, reject) ->
			console.log 'FETCH'
			collection.on 'value', (snapshot) ->
				store.updateData snapshot.val()
				# _.merge store.data, snapshot.val()
				store.loaded = true
				resolve()

	create: (newItem) ->
		data = _.cloneDeep newItem
		_.assign data,
			user: "#{auth.state.uid}": true
		
		collection.push data, (err) ->
			if !err?
				console.log 'saved'
			else
				console.log 'failed'

	remove: (key) ->
		console.log 'tyr to remove', key

export default API
