import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Method for getting signed in user data
Future<GoogleSignInAccount> getSignedInAccount(
    GoogleSignIn googleSignIn) async {
  // Is the user already signed in?
  GoogleSignInAccount account = googleSignIn.currentUser;
  // Try to sign in the previous user:
  if (account == null) {
    account = await googleSignIn.signInSilently();
  }
  return account;
}
///Method for getting firebase instance and later data
Future<FirebaseUser> signIntoFirebase(
    GoogleSignInAccount googleSignInAccount) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAuthentication googleAuth =
      await googleSignInAccount.authentication;
  return await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
}
