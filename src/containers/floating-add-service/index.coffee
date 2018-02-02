React = require 'react'
createReactClass = require 'create-react-class'
reactRedux = require 'react-redux'
h = React.createElement


# Dom
Button = require('./button.jsx').default

# --- CONFIGS LIST ---
mapStateToProps = (state, ownProps) ->
	snack: state.snacks



module.exports = reactRedux.connect(mapStateToProps) createReactClass

	render: ->
		h Button, {
			open: @props.snack.showSnack || false
		}
