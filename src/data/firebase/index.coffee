# Firebase Init
firebase = require 'firebase/app'
require 'firebase/auth'
require 'firebase/database'
require 'firebase/storage'

conf =
	apiKey: 'AIzaSyCpX2TxtehaiZFt4IO9h5BqUS90B08FVnE'
	authDomain: 'masstodon-test.firebaseapp.com'
	databaseURL: 'https://masstodon-test.firebaseio.com'
	storageBucket: 'masstodon-test.appspot.com'
	# messagingSenderId: "<SENDER_ID>"


firebaseApp = firebase.initializeApp conf

module.exports =
	firebase: firebase
	firebaseApp: firebaseApp
	firebaseAuth: firebaseApp.auth()
	firebaseDb: firebaseApp.database()
	firebaseStorage: firebaseApp.storage()
