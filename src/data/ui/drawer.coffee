{ React, createReactClass, mobx, DOM, e } = require 'app/react-tools'
{ observable, computed, action } = mobx


DrawerState = observable

	hide: false

	# Side nav
	open: true
	openNav: action -> @open = true
	close:  action -> @open = false
	toggle: action -> @open = !@open

	# Header
	text: 'Boiler room'
	setText: action (newText) -> @text = newText






module.exports = DrawerState
