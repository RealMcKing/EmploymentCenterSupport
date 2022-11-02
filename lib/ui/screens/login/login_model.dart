import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecs/ui/navigation/main_navigation.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscure = true;

  bool get isObscure => _isObscure;

  Future<void> signIn(BuildContext context) async {
    String? error;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        error = 'Для цієї електронної пошти не знайдено жодного користувача';
      } else if (e.code == 'wrong-password') {
        error = 'Для цього користувача вказано неправильний пароль';
      } else if (e.code == 'invalid-email') {
        error = 'Некоректний формат електронної пошти';
      } else if (email.isEmpty || password.isEmpty) {
        error = 'Поле пароля та електронної пошти повинні бути заповнені';
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
