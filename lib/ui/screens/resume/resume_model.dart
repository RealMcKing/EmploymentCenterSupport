import 'package:ecs/ui/navigation/main_navigation.dart';
import 'package:flutter/cupertino.dart';

class ResumeViewModel extends ChangeNotifier {
  void createOrEditResume(BuildContext context, String? resumeId) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.resumeEditorScreen,
      arguments: resumeId,
    );
  }
}
