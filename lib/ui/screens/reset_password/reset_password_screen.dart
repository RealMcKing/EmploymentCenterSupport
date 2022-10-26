import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecs/ui/screens/reset_password/reset_password_model.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 16.0),
              Text(
                'Забули свій пароль?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Введіть свою електронну адресу, щоб скинути пароль',
                style: TextStyle(
                  color: Color(0xBF000000),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.0),
              _EmailTextFieldWidget(),
              SizedBox(height: 16.0),
              _ResetPasswordButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ResetPasswordViewModel>();
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

class _ResetPasswordButtonWidget extends StatelessWidget {
  const _ResetPasswordButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ResetPasswordViewModel>();
    return ElevatedButton(
      onPressed: () => model.resetPassword(context),
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
        'Скинути пароль',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
