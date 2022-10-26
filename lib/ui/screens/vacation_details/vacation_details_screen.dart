import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecs/ui/screens/vacation_details/vacation_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class VacationDetailsScreen extends StatelessWidget {
  const VacationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<VacationDetailsViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('works')
            .where('workId', isEqualTo: model.workId)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                snapshot.data!.docs;
            var doc = docs[0];
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar.medium(
                  centerTitle: true,
                  elevation: 0,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Color(0xFFFFFFFF),
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark,
                  ),
                  backgroundColor: const Color(0xFFFFFFFF),
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  title: Text(
                    doc['name'] as String,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, bottom: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Experience: ${doc['experience'].toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                            Text(
                              'Type of employment: ${doc['typeOfEmployment'].toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                            Text(
                              'Salary: ${doc['salary'].toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFF98121).withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doc['company'].toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    Text(
                                      doc['location'].toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              doc['about'].toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),

      //
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Column(
          children: const [
            Text(
              'Apply for job',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            Text(
              'Be the first',
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
