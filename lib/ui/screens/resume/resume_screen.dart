import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecs/ui/screens/resume/resume_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ResumeViewModel>();
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Резюме',
          style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 20.0,
              fontWeight: FontWeight.w500),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF000000),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
                final name = doc["position"] as String;
                final date = doc["date"] as String;

                return ListTile(
                  onTap: () => model.createOrEditResume(context, doc['id'].toString()),
                  tileColor: const Color(0xFFF98121).withOpacity(0.12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                  ),
                  subtitle: Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF000000),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => model.createOrEditResume(context, 'Null'),
        label: Column(
          children: const [
            Text(
              'Створити',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            Text(
              'Унікальне резюме',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w300,
                fontSize: 11.0,
              ),
            ),
          ],
        ),
        icon: const Icon(
          Icons.edit,
          size: 18.0,
          color: Color(0xFFFFFFFF),
        ),
        backgroundColor: const Color(0xFF000000),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
      ),
    );
  }
}
