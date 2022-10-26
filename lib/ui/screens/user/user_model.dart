import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecs/ui/navigation/main_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  final User? user = FirebaseAuth.instance.currentUser;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void resetPassword() {
  }

  Future<void> deleteAccount() async {
    try {
      // var users = FirebaseFirestore.instance.collection('users');
      // await users.doc(user?.uid).delete();
      // await user?.delete();
      signOut();
    } catch (e) {
      log(e.toString());
    }
  }

  void editUserInformation(BuildContext context) {
    Navigator.pushNamed(context, MainNavigationRouteNames.userEditorScreen);
  }
}
