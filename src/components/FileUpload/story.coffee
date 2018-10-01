{ storiesOf, action, linkTo } = require '@storybook/react'
{ specs, describe, it, before } = require 'storybook-addon-specifications'
{ mount, render, shallow } = require 'enzyme'

{ _, React, createReactClass, reactRedux, e, DOM } = require 'app/react-tools'
{ div, h1, p, a, img, span, ul, li } = DOM

Component = require './index.coffee'
# Component = require('./myGrid.coffee')
{ MuiThemeProvider } = require '@material-ui/core/styles'


supervillains = require 'supervillains'
{ React, createReactClass, reactRedux, DOM, e, cx } = require 'app/react-tools'
{ div, ul, li, h1, p, a, img, span } = DOM

testImage = require 'assets/test/img-thumb1.jpg'

storiesOf('Drag-N-Drop', module)
	.addDecorator (story) ->
		e MuiThemeProvider, {},
			div { style: { width: '40%' } },
				story()


	.add 'Default', ->
		e Component, {
			overlay: false
		}

	.add 'hover', ->
		e Component, {
			overlay: true
		}

	.add 'with Text', ->

		e Component, {
			overlay: false
			label: supervillains.random()
		}

	.add 'with Image', ->


		e Component, {
			overlay: false
			label: supervillains.random()
			imageUri: testImage
		}

	.add 'Image and hover', ->

		e Component, {
			overlay: true
			label: supervillains.random()
			imageUri: testImage
		}

	.add 'Image and progress', ->

		e Component, {
			overlay: false
			label: supervillains.random()
			imageUri: testImage
			progress: true
		}
