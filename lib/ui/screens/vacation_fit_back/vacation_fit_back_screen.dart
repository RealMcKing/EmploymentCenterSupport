import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:ecs/ui/screens/vacation_fit_back/vacation_fit_back_model.dart';

class VacationFitBackScreen extends StatelessWidget {
  const VacationFitBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<VacationFitBackViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFFFFF),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        iconTheme: const IconThemeData(
          color: Color(0xFFF98121),
        ),
        title: const Text(
          'Виберіть резюме',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: const SelectedResumeItemWidget(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: model.sendMessage,
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                backgroundColor: Colors.black,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 84,
                  vertical: 9,
                ),
              ),
              child: const Text(
                'Вiдправити',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedResumeItemWidget extends StatelessWidget {
  const SelectedResumeItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final model = context.watch<VacationFitBackViewModel>();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('resumes')
          .where('uid', isEqualTo: user?.uid)
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
              snapshot.data!.docs;
          return ListView.separated(
            padding: const EdgeInsets.all(8.0),
            physics: const BouncingScrollPhysics(),
            itemCount: docs.length,
            itemBuilder: (_, index) {
              final doc = docs[index];
              return RadioListTile(
                tileColor: const Color(0x1FF98121),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                title: Text(
                  doc["position"] as String,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                  ),
                ),
                subtitle: Text(
                  doc["date"] as String,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF000000),
                  ),
                ),
                groupValue: model.resume,
                value: doc["resumeId"] as String,
                activeColor: const Color(0xFFF98121),
                onChanged: (String? value) {
                  model.enterSelectedResume(value);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
          );
        }
      },
    );
  }
}
