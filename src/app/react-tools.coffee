React = require 'react'

module.exports =
	_:                require 'lodash'
	React:            React
	createReactClass: require 'create-react-class'
	PropTypes:        require 'prop-types'
	ReactDOM:         require 'react-dom'
	DOM:              require 'react-dom-factories'
	mobx:             require 'mobx'
	mobxReact:        require 'mobx-react'

	# reactRedux:       require 'react-redux'
	# redux:            require 'redux'
	e:                React.createElement
	h:                React.createElement
	# cx:               require 'react-classset'
	# RootReduxForm:    require 'redux-form'
