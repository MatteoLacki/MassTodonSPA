{ _, createReactClass, e } = require 'app/react-tools'
{ observer } = require 'mobx-react'

MyFileUpload  = require 'components/FileUpload/index.coffee'

module.exports = (props) ->
	field = props.field
	purePass = _.omit props, ['field']


	if field.error?
		purePass.error = true
		purePass.helperText = field.error

	e MyFileUpload, _.assign {}, purePass,
		imageUri: field.$value || null
