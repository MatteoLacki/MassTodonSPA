path = require 'path'

s3Uploader = require './uploader.coffee'

# Manually select a mode you are in right now

# pipeline = require './secrets/develop.coffee' - not ready
pipeline = require './secrets/test.coffee'
# pipeline = require './secrets/staging.coffee' - not ready
# pipeline = require './secrets/production.coffee'




# NO NEED TO EDIT BELOW THIS LINE ------------------------------------------>


noConfMessage = """

-------------------------
You have not selected a config in tooling/upload.coffee !!!

Aborting.
-------------------------

"""


if !pipeline?
	console.error '\x1b[31m', noConfMessage ,'\x1b[0m'
	process.exit()


mode = pipeline.envName.toUpperCase()
confMessage = """

-------------------------
Uploading Masstodon SPA in a #{mode} Mode

You've been warned! (3 seconds to abort)
-------------------------

"""

# https://telepathy.freedesktop.org/doc/telepathy-glib/telepathy-glib-debug-ansi.html
console.log '\x1b[33m', confMessage ,'\x1b[0m'



endMessage = """

-------------------------
Upload done, happy #{(new Date()).toLocaleString('en-US', weekday: 'long') }
-------------------------

"""

pipeline.localPath = path.join __dirname, '../build'

setTimeout ->
	s3Uploader pipeline, (err, res) ->
		if err?
			console.log 'ERR: ', err
		else
			console.log 'Results: ', res

		console.log '\x1b[33m', endMessage ,'\x1b[0m'
		process.exit()
, 3000
