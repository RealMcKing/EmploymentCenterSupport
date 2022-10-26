import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  final emailController = TextEditingController();

  Future<void> resetPassword(BuildContext context) async {
    String email = emailController.text;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
    }
  }
}
