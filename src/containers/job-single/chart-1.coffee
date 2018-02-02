module.exports = (data) ->

	console.log 'stuff', data

	chartSetup =
		chart:
			type: 'bar'
		title:
			text: 'Total Intensity of Precursors'
		subtitle: text: 'for different charge states'
		xAxis:
			labels:
				format: "q = {value}"
			categories: [1,2,3,4,5,6,7]
			title: text: 'charge state'
		yAxis:
			title: 'Intensity'
			align: 'high'
			labels: overflow: 'justify'
		plotOptions:
			bar:
				dataLabels:
					enabled: true
		credits: enabled: false

	chartSetup.series =[
		name: 'Intensity'
		data: data.data
	]

	console.log 'chartSetup', data.data
	return chartSetup
