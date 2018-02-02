{ _, createReactClass, e } = require 'app/react-tools'
{ observer }               = require 'mobx-react'

Select = require('material-ui/Select').default

module.exports = (props) ->
	field = props.field
	purePass = _.omit props, ['field']

	if !field.focused
		if field.touched
			if field.hasError
				purePass.error = true
				purePass.helperText =  field.error


	e Select, _.assign {}, purePass,
		id: field.id

		value: field.$value
		onChange: field.onChange
		onBlur: field.onBlur
		onFocus: field.onFocus
