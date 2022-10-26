import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecs/ui/navigation/main_navigation.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscure = true;

  bool get isObscure => _isObscure;

  Future<void> signIn() async {
    //TODO
    String? error;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  void resetPassword(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.resetPasswordScreen,
    );
  }

  void visibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
