import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateVacationViewModel extends ChangeNotifier {
  final User? user = FirebaseAuth.instance.currentUser;

  final aboutController = TextEditingController();
  final companyController = TextEditingController();
  final experienceController = TextEditingController();
  final locationController = TextEditingController();
  final nameController = TextEditingController();
  final salaryController = TextEditingController();
  final typeOfEmploymentController = TextEditingController();

  void save(BuildContext context) {
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd.MM.yyyy');
      final CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('works');
      final String formattedDate = formatter.format(now);
      final String documentId = collectionReference.doc().id;
      collectionReference.doc(documentId).set(
        <String, dynamic>{
          "uid": user?.uid,
          "email": user?.email,
          "about": aboutController.text.trim(),
          "company": companyController.text.trim(),
          "experience": experienceController.text.trim(),
          "location": locationController.text.trim(),
          "name": nameController.text.trim(),
          "salary": salaryController.text.trim(),
          "tags": [''
          ],
          "typeOfEmployment": typeOfEmploymentController.text.trim(),
          "workId": documentId,
          "date": formattedDate,
        },
      );
    } catch (e) {}

    Navigator.pop(context);
  }
}
