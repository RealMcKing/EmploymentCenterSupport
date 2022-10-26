import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ResumeEditorViewModel extends ChangeNotifier {
  final String resumeId;
  final User? user = FirebaseAuth.instance.currentUser;
  final usersDatabase = FirebaseFirestore.instance.collection('resumes');

  final vacancyController = TextEditingController();
  final universityController = TextEditingController();
  final specialtyController = TextEditingController();
  final specialtyDateStartController = TextEditingController();
  final specialtyDateEndController = TextEditingController();
  final lastJobController = TextEditingController();
  final positionController = TextEditingController();
  final jobDateStartController = TextEditingController();
  final jobDateEndController = TextEditingController();
  final aboutMeController = TextEditingController();

  ResumeEditorViewModel({required this.resumeId});

  void save(BuildContext context){
    FirebaseFirestore.instance
        .collection('resumes')
        .doc().set(
      <String, dynamic>{
        "uid": user?.uid,
        "vacancy": vacancyController.text.trim(),
        "university": universityController.text.trim(),
        "specialty": specialtyController.text.trim(),
        "university-date-start": specialtyDateStartController.text.trim(),
        "university-date-end": specialtyDateEndController.text.trim(),
        "last-job": lastJobController.text.trim(),
        "position": positionController.text.trim(),
        "position-date-start": jobDateStartController.text.trim(),
        "position-date-end": jobDateEndController.text.trim(),
        "about-me": aboutMeController.text.trim(),
        "date":"22.22.2222"
      },
    );
    Navigator.pop(context);
  }
}
