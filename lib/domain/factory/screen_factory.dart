import 'package:ecs/ui/screens/auth/auth_model.dart';
import 'package:ecs/ui/screens/auth/auth_screen.dart';
import 'package:ecs/ui/screens/information/information_model.dart';
import 'package:ecs/ui/screens/information/information_screen.dart';
import 'package:ecs/ui/screens/information_client/information_client_screen.dart';
import 'package:ecs/ui/screens/information_support/information_support_model.dart';
import 'package:ecs/ui/screens/information_support/information_support_screen.dart';
import 'package:ecs/ui/screens/login/login_model.dart';
import 'package:ecs/ui/screens/login/login_screen.dart';
import 'package:ecs/ui/screens/main/main_screen.dart';
import 'package:ecs/ui/screens/reset_password/reset_password_model.dart';
import 'package:ecs/ui/screens/reset_password/reset_password_screen.dart';
import 'package:ecs/ui/screens/resume/resume_model.dart';
import 'package:ecs/ui/screens/resume/resume_screen.dart';
import 'package:ecs/ui/screens/resume_editor/resume_editor_model.dart';
import 'package:ecs/ui/screens/resume_editor/resume_editor_screen.dart';
import 'package:ecs/ui/screens/sign_up/sign_up_model.dart';
import 'package:ecs/ui/screens/sign_up/sign_up_screen.dart';
import 'package:ecs/ui/screens/user/user_model.dart';
import 'package:ecs/ui/screens/user/user_screen.dart';
import 'package:ecs/ui/screens/user_editor/user_editor_model.dart';
import 'package:ecs/ui/screens/vacation_details/vacation_details_model.dart';
import 'package:ecs/ui/screens/vacation_details/vacation_details_screen.dart';
import 'package:ecs/ui/screens/vacation_fit_back/vacation_fit_back.dart';
import 'package:ecs/ui/screens/vacation_list/vacation_list_model.dart';
import 'package:ecs/ui/screens/vacation_list/vacation_list_screen.dart';
import 'package:ecs/ui/screens/loader/loader_screen.dart';
import 'package:ecs/ui/screens/user_editor/user_editor_screen.dart';
import 'package:ecs/ui/screens/information_client/information_client_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeLoader() {
    return const LoaderScreen();
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthScreen(),
    );
  }

  Widget makeLogin() {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const LoginScreen(),
    );
  }

  Widget makeResetPassword() {
    return ChangeNotifierProvider(
      create: (_) => ResetPasswordViewModel(),
      child: const ResetPasswordScreen(),
    );
  }

  Widget makeSignUp() {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: const SignUpScreen(),
    );
  }

  Widget makeMain() {
    return const MainScreen();
  }

  Widget makeVacationList() {
    return ChangeNotifierProvider(
      create: (_) => VacationListViewModel(),
      child: const VacationListScreen(),
    );
  }

  Widget makeVacationDetails(String workId) {
    return ChangeNotifierProvider(
      create: (_) => VacationDetailsViewModel(workId: workId),
      child: const VacationDetailsScreen(),
    );
  }

  Widget makeVacationFitBack() {
    return const VacationFitBackScreen();
  }

  Widget makeInformation() {
    return ChangeNotifierProvider(
      create: (_) => InformationViewModel(),
      child: const InformationScreen(),
    );
  }

  Widget makeInformationClient() {
    return ChangeNotifierProvider(
      create: (_) => InformationClientViewModel(),
      child: const InformationClientScreen(),
    );
  }

  Widget makeInformationSupport() {
    return ChangeNotifierProvider(
      create: (_) => InformationSupportViewModel(),
      child: const InformationSupportScreen(),
    );
  }

  Widget makeResume() {
    return ChangeNotifierProvider(
      create: (_) => ResumeViewModel(),
      child: const ResumeScreen(),
    );
  }

  Widget makeResumeEditor(String resumeId) {
    return ChangeNotifierProvider(
      create: (_) => ResumeEditorViewModel(resumeId: resumeId),
      child: const ResumeEditorScreen(),
    );
  }

  Widget makeUser() {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: const UserScreen(),
    );
  }

  Widget makeUserEditor() {
    return ChangeNotifierProvider(
      create: (_) => UserEditorViewModel(),
      child: const UserEditorScreen(),
    );
  }
}
