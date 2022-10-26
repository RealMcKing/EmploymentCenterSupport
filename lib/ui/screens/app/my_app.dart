import 'package:ecs/ui/navigation/main_navigation.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Color(0xBFF98121),
        ),
        dividerColor: Colors.transparent,
      ),
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      initialRoute: MainNavigationRouteNames.loaderScreen,
    );
  }
}
