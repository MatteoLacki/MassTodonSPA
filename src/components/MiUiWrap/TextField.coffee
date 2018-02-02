{ _, e, DOM } = require 'app/react-tools'



TextField  = require('material-ui/TextField').default


module.exports = (props) ->
	purePass = _.omit props, ['input', 'meta']

	if !props.meta.active
		if props.meta.touched
			if props.meta.error?
				purePass.error = true
				purePass.helperText =  props.meta.error

	e TextField, _.assign {}, purePass,
		id: props.input.name
		value: props.input.value
		onChange: props.input.onChange
		onBlur: props.input.onBlur
		onFocus: props.input.onFocus
