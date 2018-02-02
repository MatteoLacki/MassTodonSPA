import { React, createReactClass, e, DOM, mobxReact } from 'app/react-tools'
import jsfForm from 'react-jsonschema-form'


# My imports
{ div, ul, li, h1, p, a, img, span } = DOM
import configs from 'data/configs'
# dataReference = require 'data/configs'
# dl = require 'data/configs'
import schema from 'data/configs/schema'
# schema = dataReference.schema
# actionTypes = dataReference.actions.actionTypes

# My data
uiSchema =
	distanceBetweenCharges:
		"ui:widget": "range"
log = (type) => console.log.bind console, type

API =

	create: (newItem) ->
		console.log 'involve, create item: ', newItem

	test: (result) ->
		# dl.actions.create
		# console.log 'New test fun test lol'
		# console.log '---', arguments
		# console.log 'new: ', result.formData
		# console.log 'props: ', ownProps

		# if ownProps.onSuccessSubmit?
		# 	ownProps.onSuccessSubmit()

		model = _.cloneDeep result.formData

		mods = _.cloneDeep model.modifications
		pretty = {}
		_.forEach mods, (v, k) ->
			key = "#{v.base}#{v.acid}"
			# console.log 'key: ', key
			v.modder.replace ' ', ''
			v.modder.replace ',', ''

			re = /([A-z]+[\d-]+)/g

			# els = _.split v.modder, re
			els = v.modder.match re
			pretty[key] = {}
			console.log 'all els: ', els
			_.forEach els, (el) ->
				letter = el.match(/[A-z]+/g)[0]
				digit = el.match(/[\d-]+/g)[0]
				digit = _.toNumber digit

				# console.log 'letter: ',letter
				# console.log 'digit: ',digit

				pretty[key][letter] = digit

		# console.log '*!&#(*&!@*(#&(!*@&#(*!@', pretty

		model.modifications = pretty


		# Update calc type
		opts = ['Peak Height', 'Joint Probability']
		calcType = _.cloneDeep model.calcType
		delete model.calcType
		console.log 'tyosoidfjdlsjf', calcType

		if calcType.base == opts[0]
			model.cut_off = calcType.value
		if calcType.base == opts[1]
			model.opt_P = calcType.value


		###
		 	TODO:

			result.formData.cut_off handle
			result.formData.cut_off

		###

		configs.create model
		# dispatch dl.actions.create model

	haha: (result) ->
		console.log 'inpute', result


jsProps =
	className: 'bootstrap-wrapper'
	schema: schema
	uiSchema: uiSchema
	onChange: log 'changed'
	onChange: API.haha
	onSubmit: API.test
	onError: log 'errors'

export default createReactClass
	displayName: 'ConfigForm'
	render: ->

		div { className: 'bootstrap-wrapper' },
			e jsfForm, jsProps
