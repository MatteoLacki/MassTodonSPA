# Uploads dir to s3 according to given config

s3 = require 's3'
AWS = require 'aws-sdk'

awsSdkMessage = """

-------------------------
AWS SDK is a buggy crap. Beacause of that if you will see no progress bar here in a few seconds, assume

  1) All the files you wanted to upload are there
  2) They are not and AWS sdk somehow crashed badly

If we register no activity in 5 seconds, will assume everything went ok
-------------------------

"""


module.exports = (conf, cb) ->
	# console.log "Uploading folder with a config: ", conf

	awsS3Client = new AWS.S3
		accessKeyId: conf.upload.user.accessKeyId
		secretAccessKey: conf.upload.user.secretAccessKey
		signatureVersion: conf.upload.bucket.signatureVersion
		region: conf.upload.bucket.region


	client = s3.createClient
		s3Client: awsS3Client
		maxAsyncS3: 10
		s3RetryCount: 3
		s3RetryDelay: 1000
		multipartUploadThreshold: 120971520
		multipartUploadSize: 115728640

	console.log awsSdkMessage
	client.s3.addExpect100Continue = ->

	##############

	uploader = client.uploadDir
		localDir: conf.localPath
		deleteRemoved: true
		s3Params:
			Bucket: conf.upload.bucket.name
			ACL: conf.upload.bucket.ACL if conf.upload.bucket.ACL?
			# Prefix: '/'

	uploader.on 'error', (err) ->
		console.error "Error while uploading to s3. Config: #{conf}", err.stack
		cb err

	done = ->
		console.log "Uploading to ::: #{conf.upload.bucket.name} ::: was successful."
		cb null,
			filesUploaded: filesUploaded
			totalTransfer: uploader.progressTotal

	# ------------------------------ Handling AWS mess and progress starts here

	uploads = 0
	uploadTicked = false
	filesUploaded = 0
	showProgress = ->
		if uploader.progressTotal > 0
			perc = Math.round((uploader.progressAmount / uploader.progressTotal)*100)
			console.log "progress: #{perc}% :: #{uploads} files left >> #{uploader.progressAmount} of #{uploader.progressTotal}"
		setTimeout ->
			showProgress()
		, 500
	showProgress()

	setTimeout ->
		if !uploadTicked
			done()
	, 5000


	uploader.on 'fileUploadStart', ->
		uploadTicked = true
		uploads++
	uploader.on 'fileUploadEnd', ->
		filesUploaded++
		uploads--
		if uploads == 0
			done()

	# ------------------------------ Handling AWS mess and progress ends here
