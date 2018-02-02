import { _, mobx } from 'app/react-tools'
import { firebase, firebaseDb, firebaseAuth } from 'data/firebase'
{ observable, computed, action } = mobx
delay = (t, f) -> setTimeout f, t





authState = observable

	isUserLoggedIn: false
	isInitialUserStateLoaded: false

	user: 'user.uid'
	uid: 'user.uid'
	name: 'user.displayName'
	photoUri: 'user.photoURL'
	# openNav: action -> @open = true
	# setText: action (newText) -> @text = newText

# Side effects
checkIfUserExists = (user, firebaseDb) ->
	userRef = firebaseDb.ref("users/#{user.uid}")
	userRef.once('value').then (snap) ->
		if not snap.exists()
			userRef.set
				uid: user.uid
				displayName: user.displayName
				email: user.email
				photoUrl: user.photoURL




State =

	reactRouterOnEnterMiddleWare: (nextState, replace, cb) ->
		if !@isUserLoggedIn()
			console.log 'user is not logged in'
			replace
				pathname: LOGIN_PATH
				state:
					nextPathname: nextState.location.pathname
		else
			console.log 'is in'
		cb()

	tryToLogin: () ->
		firebaseAuth.onAuthStateChanged (user) ->
			authState.isInitialUserStateLoaded = true
			if user
				checkIfUserExists user, firebaseDb

				authState.user = user.uid
				authState.uid = user.uid
				authState.displayName = user.displayName
				authState.photoURL = user.photoURL
				authState.isUserLoggedIn = true

	signInWithGoogle: () ->

		provider = new firebase.auth.GoogleAuthProvider()

		provider.addScope 'https://www.googleapis.com/auth/userinfo.profile'
		provider.addScope 'https://www.googleapis.com/auth/userinfo.email'

		firebase.auth().signInWithPopup(provider).then (result) ->

			console.log 'user', result
			user = result

			authState.user = user.uid
			authState.uid = user.uid
			authState.displayName = user.displayName
			authState.photoURL = user.photoURL
			authState.isUserLoggedIn = true

		.catch (e) ->
			console.error 'ouch, e: ', e

			# errorCode = error.code
			# errorMessage = error.message
			# email = error.email
			# credential = error.credential

	signOut: () ->
		firebaseAuth.signOut().then ->
			authState.isUserLoggedIn = false

	state: authState


export default State
