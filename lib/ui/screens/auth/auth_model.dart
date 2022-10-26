import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (authResult.additionalUserInfo!.isNewUser) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user?.uid)
          .set(
        <String, dynamic>{
          "uid": authResult.user?.uid,
          "first-name": "",
          "last-name": "",
          "phone-number": "",
          "city": "",
          "birthday": "",
        },
      );
    }
  }
}
