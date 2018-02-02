{ _, e, DOM } = require 'app/react-tools'
Dialogue      = require('components/Dialogue/index.jsx').default

module.exports = (props) ->
	purePass = _.omit props, ['input', 'meta']

	if !props.meta.active
		if props.meta.touched
			if props.meta.error?
				purePass.error = true
				purePass.helperText = props.meta.error

	e Dialogue, _.assign {}, purePass,
		label: props.label
		options: props.options
		selectedIndex: props.input.value
		onChange: props.input.onChange
