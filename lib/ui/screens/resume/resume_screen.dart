import 'package:flutter/material.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Resume',
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const ResumeItemWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        itemCount: 7,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Column(
          children: const [
            Text(
              'Create',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            Text(
              'Unique resume',
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

class ResumeItemWidget extends StatelessWidget {
  const ResumeItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      tileColor: const Color(0xFFF98121).withOpacity(0.12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: const Text(
        'Middle Flutter Developer 1',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
      ),
      subtitle: const Text(
        '20.01.2021',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
