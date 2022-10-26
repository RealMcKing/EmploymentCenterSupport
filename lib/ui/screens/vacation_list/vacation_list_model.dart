import 'package:flutter/material.dart';

import 'package:ecs/ui/navigation/main_navigation.dart';

class VacationListViewModel extends ChangeNotifier {
  final searchController = TextEditingController();

  void openDetailVacation(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.vacationDetailsScreen,
      arguments: id,
    );
  }
}
