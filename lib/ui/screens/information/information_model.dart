import 'package:ecs/ui/navigation/main_navigation.dart';
import 'package:flutter/cupertino.dart';

class InformationViewModel extends ChangeNotifier {
  void openClientEC(BuildContext context) {
    Navigator.pushNamed(
        context, MainNavigationRouteNames.informationClientScreen);
  }

  void openAdditionalInformation(BuildContext context) {
    Navigator.pushNamed(
        context, MainNavigationRouteNames.informationSupportScreen);
  }
}
