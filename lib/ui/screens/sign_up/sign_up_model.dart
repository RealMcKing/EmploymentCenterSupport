import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

  bool _isObscure = true;
  bool _isObscureConfirmation = true;

  bool get isObscure => _isObscure;

  bool get isObscureConfirmation => _isObscureConfirmation;

  Future<void> signUp() async {
    String? error;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmationPassword = confirmationPasswordController.text.trim();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then(
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
            "birthday": ""
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
      }
    } catch (e) {
      error = 'Other error';
    }
  }

  void visibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void visibilityConfirmation() {
    _isObscureConfirmation = !_isObscureConfirmation;
    notifyListeners();
  }
}
