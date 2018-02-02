
{ _, e, DOM } = require 'app/react-tools'

FormControlLabel = require('material-ui/Form/FormControlLabel').default
Switch           = require('material-ui/Switch').default


module.exports = (props) ->
	purePass = _.omit props, ['input', 'meta']


	e FormControlLabel, _.assign {}, purePass,
		label: props.label

		control:
			e Switch, {
				checked: props.input.value

				onChange: props.input.onChange
				onBlur: props.input.onBlur
				onFocus: props.input.onFocus
			}
