import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';

class Auth extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  User? currentUser;

  Auth() {
    _firebaseAuth.userChanges().listen((user) {
      if (user != null) currentUser = user;
      notifyListeners();
    });
  }

  bool get isSignedIn => currentUser != null;

  // String? get uid {
  //   if (currentUser != null) return currentUser.uid;

  //   return null;
  // }

  ///return null the user sign-in with Google.
  ///otherwise a message with the error will be returned.
  Future signInWithGoogle() async {
    //Prevent google sign-in from automatically sign-in with a default account.
    _googleSignIn.signOut();

    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("no google user");
        return;
      }
      ;

      final googleAuth = await googleUser.authentication;
      print(googleUser.displayName);
      await _firebaseAuth.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        ),
      );
      return;
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    currentUser = null;
    notifyListeners();
  }
}
