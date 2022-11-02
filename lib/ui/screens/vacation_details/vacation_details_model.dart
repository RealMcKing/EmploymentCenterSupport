import 'package:ecs/ui/navigation/main_navigation.dart';
import 'package:flutter/cupertino.dart';

class VacationDetailsViewModel extends ChangeNotifier {
  final String workId;

  VacationDetailsViewModel({
    required this.workId,
  });

  void openFitBack(BuildContext context, String workId) {
    Navigator.pushNamed(
      context,
      MainNavigationRouteNames.vacationFitBackScreen,
      arguments: workId,
    );
  }
}
