module.exports =
	cache: true
	entry: './src/index.coffee'
	output:
		filename: './build/app.js'
	resolve:
		extensions: [
			'.jsx'
			'.cjsx'
			'.coffee'
			'.js'
		]
	module: loaders: [
			test: /\.jsx$/
			loader: 'jsx-loader?insertPragma=React.DOM'
		,
			test: /\.cjsx$/
			loaders: [
				'coffee-loader'
				'cjsx-loader'
			]
		,
			test: /\.coffee$/
			loader: 'coffee-loader'
	]
