import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class VacationFitBackViewModel extends ChangeNotifier {
  final String workId;
  String? resume;

  VacationFitBackViewModel({
    required this.workId,
  });

  void enterSelectedResume(String? value) {
    resume = value;
    notifyListeners();
  }

  Future<void> sendMessage() async {
    var doc =
        await FirebaseFirestore.instance.collection('works').doc(workId).get();

    String address = Uri.encodeComponent(doc['email'].toString());
    String subject = Uri.encodeComponent("");
    String body = Uri.encodeComponent(resume ?? '');
    Uri url = Uri.parse("mailto:$address?subject=$subject&body=$body");
    try {
      await launchUrl(url);
    } catch (e) {
      throw "Could not launch $url";
    }
  }
}
