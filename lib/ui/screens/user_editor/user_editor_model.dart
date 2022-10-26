import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserEditorViewModel extends ChangeNotifier {
  final usersDatabase = FirebaseFirestore.instance.collection('users');
  final User? user = FirebaseAuth.instance.currentUser;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthdayController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final cityController = TextEditingController();

  Future<void> saveInformation(BuildContext context) async {
    usersDatabase.doc(user?.uid).update(
      <String, dynamic>{
        "uid": user?.uid,
        "first-name": firstNameController.text.trim(),
        "last-name": lastNameController.text.trim(),
        "phone-number": birthdayController.text.trim(),
        "city": phoneNumberController.text.trim(),
        "birthday": cityController.text.trim()
      },
    );
    Navigator.pop(context);
  }
}
