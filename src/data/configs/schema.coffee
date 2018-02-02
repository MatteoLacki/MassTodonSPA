###

fasta=

'MQIFVKTLTGKTITLEVEPSDTIENVKAKIQDKEGIPPDQQRLIFAGKQLEDGRTLSDYNIQKESTLHLVLRLRGG'
Q=8
modifications = {   ('N',2) :       {'H': 1, 'O': +2, 'N': +3},
('Calpha',2) :  {'H': 1, 'O': +2, 'N': +3},
('Calpha',5) :  {'H': 2, 'S': +2, 'N': +2},
('C',6) :       {'H': 2, 'S': +2, 'N': +200} }

​może dodać (tu daję dafaulty):

fragType = 'cz',
isoMasses       = None,
isoProbs        = None,
jP=.99
mzPrec=.05
precDigits=2
M_minProb=0.7
cutOff = 100
topPercent = .999
L1_x=0.001
L2_x=0.001
L1_alpha=0.001
L2_alpha=0.001
​solver  = 'sequential',
method  = 'MSE',
max_times_solve = 5
verbose = False
distanceBetweenCharges=5

###


module.exports =
	# title: 'SpectroConfig'
	type: 'object'
	# required: [ 'fasta', 'configName' ]
	properties:
		configName:
			type: 'string'
			title: 'Config name'
			default: 'My Config 1'
		# nickname:
		# 	type: 'string'
		# 	title: 'nickname'
		# 	default: 'Ewi'
		fasta:
			type: 'string'
			title: 'Amino Acid Sequence'
			default: ''
		modifications:
			type: 'array'
			title: 'Modifications'
			default: []
			items:
				type: 'object'
				# required: [ 'base', 'acid', 'modder' ]
				properties:
					base:
						type: 'string'
						title: 'Backbone atom'
						enum: ['N', 'C', 'Calpha']
					acid:
						type: 'number'
						title: 'Amino acid number'
					modder:
						type: 'string'
						title: 'modder'
						default: "C12H-2"
						examples: [
							"{'HD': 479, 'O': +2, 'N': +3}"
							"{'H': 1, 'O': +2, 'N': +3}"
						]



		precursor_charge:
			type: 'number'
			title: 'Precursor Charge'
			default: 8
			minimum: 1
	
		mz_prec:
			type: 'number'
			title: 'Mass precision'
			default: 0.05
			minimum: 0

		calcType:
			type: 'object'
			title: 'Processing Mode'
			properties:
				base:
					type: 'string'
					title: 'Type of cutoff'
					enum: ['Peak Height', 'Joint Probability']
				value:
					type: 'number'
					title: 'Value'

		# fragType:
		# 	type: 'string'
		# 	title: 'FragType'
		# 	default: 'cz'
		# solver:
		# 	type: 'string'
		# 	title: 'Solver'
		# 	default: 'sequential'
		# 	enum: [
		# 		'sequential'
		# 		'parallel'
		# 	]
		# distanceBetweenCharges:
		# 	type: 'integer'
		# 	title: 'Distance Between Charges'
		# 	default: 5
		# 	minimum: 1
		# 	maximum: 10
		# 	multipleOf: 1
