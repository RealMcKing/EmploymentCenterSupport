import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationSupportViewModel extends ChangeNotifier {
  Future<void> callNumber(String number) async {
    final url = Uri.parse('tel:$number');
    try {
      launchUrl(url);
    } catch (e) {
      throw "Could not launch $url";
    }
  }

  Future<void> sendMessage(String email) async {
    String address = Uri.encodeComponent(email);
    String subject = Uri.encodeComponent("");
    String body = Uri.encodeComponent("");
    Uri url = Uri.parse("mailto:$address?subject=$subject&body=$body");
    try {
      await launchUrl(url);
    } catch (e) {
      throw "Could not launch $url";
    }
  }

  Future<void> openLink(String link) async {
    final url = Uri.parse(link);
    try {
      await launchUrl(url);
    } catch (e) {
      throw "Could not launch $url";
    }
  }
}
