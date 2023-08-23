import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavors/general/models/models.dart';
import 'package:flavors/general/notifiers/notifiers.dart';
import 'package:flavors/general/services/services.dart';
import 'package:flavors/general/widgets/widgets.dart';
import 'package:flavors/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  // static final FacebookAuth _facebookAuth = FacebookAuth.instance;

  // User stream
  static Stream<User?> get appUserStream {
    return _auth.authStateChanges();
  }

  // Current user id
  static String? get currentUserId {
    return _auth.currentUser?.uid;
  }

  // Register with email
  static Future registerWithEmail(BuildContext context,
      {required String email, required String password, required String name}) async {
    try {
      // Register in Firebase Auth
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user == null) return;

      // Update display name
      credential.user!
          .updateDisplayName(
            name,
          )
          .whenComplete(
            () => credential.user!.reload(),
          );

      AppUser appUser = AppUser(
        uid: _auth.currentUser!.uid,
        name: name,
      );
      await UserDatabase.create(context, appUser: appUser);

      // TODO: Update notifiers
      // TODO: Better way to push to wrapper
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Wrapper()), (_) => false);
    } on FirebaseAuthException catch (error) {
      showErrorDialog(context,
          message: error.message ?? 'There was an error with authorisation.');
    }
  }

  // Sign in with email
  static Future signInWithEmail(BuildContext context,
      {required String email, required String password}) async {
    try {
      // Login to firebase
      UserCredential credential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);

      // TODO: read user from database and update notifiers
    } on FirebaseAuthException catch (error) {
      showErrorDialog(context,
          message: error.message ?? "There has been an error logging in.");
    }
  }

  // Forgot password
  static Future forgotPassword(BuildContext context, {required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showSnackBar(context, 'Sent password reset email.');
    } on FirebaseAuthException catch (error) {
      showErrorDialog(context,
          message: error.message ?? 'There was an error with this process.');
    }
  }

  // Sign out
  static Future signOut(BuildContext context) async {
    try {
      UserNotifier userNotifier = Provider.of<UserNotifier>(context, listen: false);

      userNotifier.setCurrentUser = null;

      await _auth.signOut();
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Wrapper()), (_) => false);
    } on FirebaseAuthException catch (error) {
      showErrorDialog(context,
          message: error.message ?? "There was an error deleting your account");
    }
  }

  // Delete account
  static Future delete(BuildContext context) async {
    try {
      UserNotifier userNotifier = Provider.of<UserNotifier>(context, listen: false);

      userNotifier.setCurrentUser = null;
      await UserDatabase.deleteUserWithUID(context, uid: _auth.currentUser!.uid);
      await _auth.currentUser?.delete();
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Wrapper()), (_) => false);
    } on FirebaseAuthException catch (error) {
      showErrorDialog(context,
          message: error.message ?? "There was an error deleting your account");
    }
  }
}





  // Sign in with facebook
  // static Future signInWithFacebook(BuildContext context) async {
  //   try {
  //     LoginResult facebookLoginResult = await _facebookAuth.login(permissions: ['email']);

  //     // if (facebookLoginResult.accessToken == null) return;

  //     // OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);

  //     // UserCredential credential = await _auth.signInWithCredential(facebookAuthCredential);

  //     // print(credential.user.toString());
  //   } on FirebaseAuthException catch (error) {
  //     showErrorDialog(context, message: error.message ?? "There was an issue with facebook login");
  //   }
  // }