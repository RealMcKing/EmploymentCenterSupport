import 'package:ecs/ui/screens/auth/auth_screen.dart';
import 'package:ecs/ui/screens/information/information_screen.dart';
import 'package:ecs/ui/screens/information_client/information_client_screen.dart';
import 'package:ecs/ui/screens/information_support/information_support_screen.dart';
import 'package:ecs/ui/screens/login/login_screen.dart';
import 'package:ecs/ui/screens/main/main_screen.dart';
import 'package:ecs/ui/screens/resume/resume_screen.dart';
import 'package:ecs/ui/screens/settings/settings_screen.dart';
import 'package:ecs/ui/screens/sign_up/sign_up_screen.dart';
import 'package:ecs/ui/screens/user/user_screen.dart';
import 'package:ecs/ui/screens/vacation_details/vacation_details_screen.dart';
import 'package:ecs/ui/screens/vacation_fit_back/vacation_fit_back.dart';
import 'package:ecs/ui/screens/vacation_list/vacation_screen.dart';
import 'package:ecs/ui/screens/loader/loader_screen.dart';
import 'package:ecs/ui/screens/user_editor/user_editor_screen.dart';

import 'package:flutter/material.dart';

class ScreenFactory {
  Widget makeLoader() {
    return const LoaderScreen();
  }

  Widget makeAuth() {
    return AuthScreen();
  }

  Widget makeLogin() {
    return const LoginScreen();
  }

  Widget makeSignUp() {
    return const SignUpScreen();
  }

  Widget makeMain() {
    return const MainScreen();
  }

  Widget makeSettings() {
    return const SettingsScreen();
  }

  Widget makeVacationList() {
    return const VacationListScreen();
  }

  Widget makeVacationDetails() {
    return const VacationDetailsScreen();
  }

  Widget makeVacationFitBack() {
    return const VacationFitBackScreen();
  }

  Widget makeInformation() {
    return const InformationScreen();
  }

  Widget makeInformationClient() {
    return const InformationClientScreen();
  }

  Widget makeInformationSupport() {
    return const InformationSupportScreen();
  }

  Widget makeResume() {
    return const ResumeScreen();
  }

  Widget makeResumeEditor() {
    return const ResumeScreen();
  }

  Widget makeUser() {
    return const UserScreen();
  }

  Widget makeUserEditor() {
    return const UserEditorScreen();
  }
}
