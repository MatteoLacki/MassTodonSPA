_ = require 'lodash'
{ handleActions } = require 'redux-actions'



# STATE CHANGES
actions = require './actions'



actionsMap = [
		action: actions.actionTypes.fetched
		handle: (state, action) ->
			_.forEach action.payload, (v, k) ->
				v.key = k

			action.payload
	,
		action: actions.DELETE
		handle: (state, action) ->
			newState = _.cloneDeep(state)
			# delete newState[action.payload.id]
]

module.exports =
	userFiles: handleActions _.mapValues(_.keyBy(actionsMap, 'action'), 'handle'), []
