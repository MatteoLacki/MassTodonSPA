{ React, createReactClass, mobx, DOM, e } = require 'app/react-tools'
{ observable, computed, action } = mobx


DrawerState = observable

	open: false
	hide: false
	openNav: action -> @open = true
	close:  action -> @open = false
	toggle: action -> @open = !@open

	text: 'Boiler room'
	setText: action (newText) -> @text = newText






module.exports = DrawerState
