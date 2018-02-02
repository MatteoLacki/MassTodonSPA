{ _, createReactClass, e } = require 'app/react-tools'
{ observer } = require 'mobx-react'
TextField   = require('material-ui/TextField').default

module.exports = observer (props) ->
	field = props.field
	purePass = _.omit props, ['field']

	if field.error?
		purePass.error = true
		purePass.helperText =  field.error

	e TextField, _.assign {}, purePass,
		id: field.id
		label: field.label
		type: field.type

		value: field.$value
		onChange: field.onChange
		onBlur: field.onBlur
		onFocus: field.onFocus
