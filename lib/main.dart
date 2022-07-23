import 'package:ecs/widgets/auth/auth_widget.dart';
import 'package:ecs/widgets/fit_back_vacation/fit_back_widget.dart';
import 'package:ecs/widgets/information_subtype/information_subtype.dart';
import 'package:ecs/widgets/information_type/information_type.dart';
import 'package:ecs/widgets/main_screen/main_screen_widget.dart';
import 'package:ecs/widgets/on_boarding/on_boarding_widget.dart';
import 'package:ecs/widgets/resume/resume_widget.dart';
import 'package:ecs/widgets/settings/settings_widget.dart';
import 'package:ecs/widgets/sign_up/sign_up_widget.dart';
import 'package:ecs/widgets/user/user_widget.dart';
import 'package:ecs/widgets/vacation/vacation_widget.dart';
import 'package:ecs/widgets/vacation_details/vacation_details_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      routes: {
        '/': (context) => const OnBoarding(),
        '/auth': (context) => const AuthWidget(),
        '/sign_up': (context) => const SignUpWidget(),
        '/main': (context) => const MainScreenWidget(),
        '/main/vacation': (context) => const VacationWidget(),
        '/main/vacation/vacation_details': (context) => const VacationDetailsWidget(),
        '/main/vacation/vacation_details/fit_back_vacation': (context) => const FitBackWidget(),

        '/main/information_type': (context) => const InformationTypeWidget(),
        '/main/information_type/information_subtype': (context) => const InformationSubtypeWidget(),

        '/main/resume': (context) => const ResumeWidget(),
        '/main/settings': (context) => const SettingsWidget(),
        '/main/user': (context) => const UserWidget(),
      },
      initialRoute: '/',
    );
  }
}











































