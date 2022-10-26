import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecs/ui/screens/vacation_list/vacation_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VacationListScreen extends StatelessWidget {
  const VacationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: TextField(
          autocorrect: false,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.none,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          cursorRadius: const Radius.circular(4),
          cursorColor: const Color(0xFFF98121),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            hintText: 'What your find?',
            hintStyle: const TextStyle(
              color: Color.fromRGBO(111, 119, 137, 1),
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            filled: true,
            isDense: false,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            fillColor: const Color.fromRGBO(242, 242, 242, 0.48),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: const EdgeInsets.all(0.0)),
            icon: const Icon(
              Icons.filter_list_rounded,
              color: Color.fromRGBO(249, 129, 33, 1),
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('works').snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                snapshot.data!.docs;
            return ListView.separated(
              padding: const EdgeInsets.all(8.0),
              physics: const BouncingScrollPhysics(),
              itemCount: docs.length,
              itemBuilder: (_, index) {
                final doc = docs[index];
                return _JobBlockWidget(work: doc);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
            );
          }
        },
      ),
    );
  }
}

class _JobBlockWidget extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> work;

  const _JobBlockWidget({Key? key, required this.work}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = work["name"] as String;
    final tags = work['tags'] as List<dynamic>;
    final company = work['company'] as String;
    final date = work['date'] as String;
    final model = context.read<VacationListViewModel>();

    return InkWell(
      onTap: () => model.openDetailVacation(context, work.id),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 242, 242, 0.36),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            tags.isNotEmpty
                ? _JobBlockTagsListWidget(tags: tags)
                : const SizedBox.shrink(),
            const SizedBox(height: 4),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: company,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(249, 129, 33, 1),
                        ),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: date,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _JobBlockTagsListWidget extends StatelessWidget {
  final List<dynamic> tags;

  const _JobBlockTagsListWidget({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _JobBlockTagWidget(tag: tags[index] as String);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8.0);
        },
        itemCount: tags.length,
        padding: const EdgeInsets.all(4.0),
      ),
    );
  }
}

class _JobBlockTagWidget extends StatelessWidget {
  final String tag;

  const _JobBlockTagWidget({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 242, 242, 0.48),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Color(0xFF6F7789),
        ),
      ),
    );
  }
}
