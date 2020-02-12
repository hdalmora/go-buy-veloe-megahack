import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationResources {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<FirebaseUser> get onAuthStateChange => _firebaseAuth.onAuthStateChanged;

  Future<String> getUserUID() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  Future<void> signWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      await _firebaseAuth.signInWithCredential(credential);

      return 1;
    } on PlatformException catch (e) {
      print(
          "Platform Exception: Error communicating with the Google Platform: {$e}");
      return -1;
    } catch (e) {
      print("Exception: Error: ${e.toString()}");
      return -2;
    }
  }

  Future<int> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return 1;
    } on PlatformException catch (e) {
      print("Platform Exception: Authentication: " +
          e.toString());
      return -1;
    } catch (e) {
      print("Exception: Error: " + e.toString());
      return -2;
    }
  }

  Future<int> signUpWithEmailAndPassword(String email, String password, String displayName) async {
    try {
      AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await setUserDisplayName(authResult.user, displayName);
      return 1;
    } on PlatformException catch (e) {
      print(
          "Platform Exception: Authentication: " +
              e.toString());
      return -1;
    } catch (e) {
      print("Exception: Authentication: " + e.toString());

      return -2;
    }
  }

  Future<void> setUserDisplayName(FirebaseUser user, String displayName) async {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = displayName;
    await user.updateProfile(updateInfo);
  }

  Future<void> get signOut async {
    _firebaseAuth.signOut();
    _googleSignIn.signOut();
  }
}