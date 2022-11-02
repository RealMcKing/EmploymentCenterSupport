import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

  bool _isObscure = true;
  bool _isObscureConfirmation = true;

  bool get isObscure => _isObscure;

  bool get isObscureConfirmation => _isObscureConfirmation;

  Future<void> signUp(BuildContext context) async {
    String? error;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmationPassword = confirmationPasswordController.text.trim();
    try {
      if (password != confirmationPassword) {
        throw Exception('passwords-error');
      }
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
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
        error = 'Ваш пароль недостатньо надійний';
      } else if (e.code == 'email-already-in-use') {
        error = 'Вже існує обліковий запис із вказаною електронною адресою';
      } else if (e.code == 'invalid-email') {
        error = 'Некоректний формат електронної пошти';
      } else if (e.code == 'passwords-error') {
        error = 'Некоректний формат електронної пошти';
      } else if (email.isEmpty ||
          password.isEmpty ||
          confirmationPassword.isEmpty) {
        error = 'Заповніть всі поля';
      } else if (password != confirmationPassword) {
        error = 'Паролі не співпадають';
      } else {
        error = 'Вибачте. Відбулася непередбачена помилка. Спробуй пізніше';
      }
      final snackBar = SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Виникла помилка",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                error,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
