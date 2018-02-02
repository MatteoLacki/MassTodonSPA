React = require 'react'
createReactClass = require 'create-react-class'


# UI elems
{ div, h1, p, a, img, span, ul, li } = React.DOM
styles = require './index.styl'



# Dom

listElement = (item, actions) ->
	div { key: item.key, className: "#{styles.default}" },
		div {className: 'row list-group-item vertical-container'},
				div {className: 'col-xs-10 col-sm-10 col-md-8'},
					span null, "#{item.configName}"
				div { className: 'col-sm-2 col-md-4' },
					div {className: 'btn btn-info pull-right'}, 'edit'
					div {
						className: 'btn btn-danger pull-right',
						onClick: ->
							actions.remove item.key
					}, 'remove'



module.exports =
	listElement: listElement
