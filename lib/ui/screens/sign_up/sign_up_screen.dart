import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecs/ui/screens/sign_up/sign_up_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Ласкаво просимо',
              style: TextStyle(
                color: Colors.black,
                fontSize: 64,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Будь ласка, заповніть усі форми',
              style: TextStyle(
                color: Colors.black.withOpacity(0.75),
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32.0),
            const _EmailTextFieldWidget(),
            const SizedBox(height: 16.0),
            const _PasswordTextFieldWidget(),
            const SizedBox(height: 16.0),
            const _ConfirmationPasswordTextFieldWidget(),
            const SizedBox(height: 16.0),
            const _SignUpButtonWidget(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11),
          ],
        ),
      ),
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<SignUpViewModel>();
    return TextField(
      controller: model.emailController,
      autocorrect: false,
      enableSuggestions: false,
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      cursorRadius: const Radius.circular(4),
      cursorColor: const Color(0xFFF98121),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: 'Електронна пошта',
        hintStyle: const TextStyle(
          color: Color.fromRGBO(111, 119, 137, 1),
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        filled: true,
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        fillColor: const Color.fromRGBO(242, 242, 242, 0.48),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _PasswordTextFieldWidget extends StatelessWidget {
  const _PasswordTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpViewModel>();
    return TextField(
      controller: model.passwordController,
      autocorrect: false,
      enableSuggestions: false,
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: model.isObscure,
      cursorRadius: const Radius.circular(4),
      cursorColor: const Color(0xFFF98121),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: 'Пароль',
        hintStyle: const TextStyle(
          color: Color.fromRGBO(111, 119, 137, 1),
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        filled: true,
        isDense: false,
        suffixIcon: IconButton(
          iconSize: 20.0,
          onPressed: model.visibility,
          splashRadius: 18.0,
          icon: Icon(
            model.isObscure ? Icons.visibility_off : Icons.visibility,
            color: const Color.fromRGBO(111, 119, 137, 1),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        fillColor: const Color.fromRGBO(242, 242, 242, 0.48),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _ConfirmationPasswordTextFieldWidget extends StatelessWidget {
  const _ConfirmationPasswordTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SignUpViewModel>();
    return TextField(
      controller: model.confirmationPasswordController,
      autocorrect: false,
      enableSuggestions: false,
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: model.isObscureConfirmation,
      cursorRadius: const Radius.circular(4),
      cursorColor: const Color(0xFFF98121),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: 'Повторіть пароль',
        hintStyle: const TextStyle(
          color: Color.fromRGBO(111, 119, 137, 1),
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        filled: true,
        isDense: false,
        suffixIcon: IconButton(
          iconSize: 20.0,
          onPressed: model.visibilityConfirmation,
          splashRadius: 18.0,
          icon: Icon(
            model.isObscureConfirmation
                ? Icons.visibility_off
                : Icons.visibility,
            color: const Color.fromRGBO(111, 119, 137, 1),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        fillColor: const Color.fromRGBO(242, 242, 242, 0.48),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _SignUpButtonWidget extends StatelessWidget {
  const _SignUpButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<SignUpViewModel>();
    return ElevatedButton(
      onPressed: () => model.signUp(context),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 84,
          vertical: 9,
        ),
      ),
      child: const Text(
        'Зареєструватися',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
