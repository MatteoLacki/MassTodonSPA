import { _, mobx } from 'app/react-tools'
{ observable, computed, action } = mobx
import { firebaseDb, firebaseAuth } from 'data/firebase'
import auth from 'data/auth/state'

# Data
collection = firebaseDb.ref 'jobs'
store = observable
	data: {}
	loaded: false
	updateData: action 'merge-jobs', (newData) ->
		_.merge store.data, newData

fs = null
API =
	store: store
	fetch: () ->
		return fs if fs?

		fs = new Promise (resolve, reject) ->
			collection.on 'value', (snapshot) ->
				store.updateData snapshot.val()
				# _.merge store.data, snapshot.val()
				store.loaded = true

				_.forEach store.data, (el) ->
					console.log 'el', el
					el.label = "#{el.name}"
					el.secondary = "#{el.config.configName}, #{el.config.solver} solver"

				resolve()

	createOld: (job) ->
		uid = auth.state.uid
		data =
			owner: uid
			name: job.name
			processed: false
			config: job.config
			file: job.file

		console.log 'server submit job', job
		console.log 'server submit job', data
		# if isServerValid data
		# 	collection.push data, (err) ->
		# 		if !err?
		# 			dispatch type: actionTypes.CREATED
		# 		else
		# 			dispatch type: actionTypes.FAILED_CREATING
		# else
		# 	console.log 'not valid: ', isServerValid.errors
		# 	dispatch type: actionTypes.FAILED_CREATING


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
