import 'package:flutter/material.dart';

import 'package:ecs/domain/factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderScreen = '/';
  static const authScreen = '/auth';
  static const resetPasswordScreen = '/auth/reset';
  static const mainScreen = '/main';
  static const settingScreen = '/main/settings';
  static const vacationDetailsScreen = '/main/vacation_list/vacation_details';
  static const vacationFitBackScreen =
      '/main/vacation_list/vacation_details/fit_back_vacation';
  static const informationClientScreen = '/main/client';
  static const informationSupportScreen = '/main/support';
  static const resumeEditorScreen = '/main/resume_editor';
  static const userEditorScreen = '/main/user_editor';
  static const createVacationScreen = '/main/create_vacation';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderScreen: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.authScreen: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMain(),
    MainNavigationRouteNames.informationClientScreen: (_) =>
        _screenFactory.makeInformationClient(),
    MainNavigationRouteNames.informationSupportScreen: (_) =>
        _screenFactory.makeInformationSupport(),
    MainNavigationRouteNames.userEditorScreen: (_) =>
        _screenFactory.makeUserEditor(),
    MainNavigationRouteNames.resetPasswordScreen: (_) =>
        _screenFactory.makeResetPassword(),
    MainNavigationRouteNames.createVacationScreen: (_) =>
        _screenFactory.makeCreateVacation(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.vacationDetailsScreen:
        final arguments = settings.arguments;
        final workId = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeVacationDetails(workId),
        );
      case MainNavigationRouteNames.resumeEditorScreen:
        final arguments = settings.arguments;
        final resumeId = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeResumeEditor(resumeId),
        );
      case MainNavigationRouteNames.vacationFitBackScreen:
        final arguments = settings.arguments;
        final workId = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeVacationFitBack(workId),
        );
      default:
        const widget = Text("Navigation Error");
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
