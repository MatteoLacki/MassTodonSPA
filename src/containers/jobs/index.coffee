import { React, createReactClass, e, DOM, mobxReact } from 'app/react-tools'

# Dom
import JobsList from 'components/JobsList'
import jobs from 'data/jobs'
# CircularLoader = React.createFactory require('components/CircularLoader').default

# mapStateToProps = (state, ownProps) ->
# 	happyJobs: selectors.getHappyJobs state

# mapDispatchToProps = (dispatch, ownProps) ->
# 	fetch:         -> dispatch actions.fetch()
# 	remove: (key)  -> dispatch actions.remove key
# 	create: (name) -> dispatch actions.create name



export default mobxReact.observer createReactClass

	componentWillMount: -> jobs.fetch()

	render: ->

		console.log jobs.store
		console.log 'lol, jobs list page '
		if jobs.store.loaded
			console.log 'loaded'
			e JobsList, {
				items: jobs.store.data
				actions:
					delete: (k) -> console.log 'try to delete', k
			}
		else
			console.log 'not loader'

		# null
