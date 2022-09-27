import 'package:flutter/material.dart';

import 'package:ecs/domain/factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderScreen = '/';
  static const authScreen = 'auth';
  static const mainScreen = '/main';
  static const settingScreen = '/main/settings';
  static const vacationDetailsScreen = '/main/vacation_list/vacation_details';
  static const vacationFitBackScreen =
      '/main/vacation_list/vacation_details/fit_back_vacation';
  static const informationClientScreen = '/main/client';
  static const informationSupportScreen = '/main/support';
  static const resumeEditorScreen = '/main/resume_editor';
  static const userEditorScreen = '/main/user_editor';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderScreen: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.authScreen: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMain(),
    MainNavigationRouteNames.settingScreen: (_) =>
        _screenFactory.makeSettings(),
    MainNavigationRouteNames.vacationDetailsScreen: (_) =>
        _screenFactory.makeVacationDetails(),
    MainNavigationRouteNames.vacationFitBackScreen: (_) =>
        _screenFactory.makeVacationFitBack(),
    MainNavigationRouteNames.informationClientScreen: (_) =>
        _screenFactory.makeInformationClient(),
    MainNavigationRouteNames.informationSupportScreen: (_) =>
        _screenFactory.makeInformationSupport(),
    MainNavigationRouteNames.resumeEditorScreen: (_) =>
        _screenFactory.makeResumeEditor(),
    MainNavigationRouteNames.userEditorScreen: (_) =>
        _screenFactory.makeUserEditor(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        const widget = Text("Navigation Error");
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
