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
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) => FirebaseFirestore.instance
              .collection('users')
              .doc(value.user?.uid)
              .set(
            <String, dynamic>{
              "uid": value.user?.uid,
              "first-name": "",
              "last-name": "",
              "phone-number": "",
              "city": "",
              "birthday": "",
            },
          ),
        );
  }
}
