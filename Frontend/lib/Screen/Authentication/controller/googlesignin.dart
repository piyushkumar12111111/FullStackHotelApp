import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking/Screen/Home/home.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          // Navigate to the HomeScreen if the sign in was successful

          // Use the user's name and email
          String name = user.displayName ?? "No name available";
          String email = user.email ?? "No email available";

          // For demonstration, let's print these values
          print("Name: $name");
          print("Email: $email");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ));
        }
        return user;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }
}
