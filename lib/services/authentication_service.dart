

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/models/batasan_user.dart';
import 'firestore_service.dart';




class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  BatasanUser _currentUser;
  BatasanUser get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = BatasanUser(
        id: authResult.user.uid,
        email: email,
      );

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
     await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  Future<bool> signOutUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
   // print(user.providerData[1].providerId);
    // if (user.providerData[1].providerId == 'google.com') {
    //   await gooleSignIn.disconnect();
    // }
    await _firebaseAuth.signOut();
    return Future.value(true);
  }
}
