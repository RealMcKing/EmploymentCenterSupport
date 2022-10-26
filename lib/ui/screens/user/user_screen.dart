import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:ecs/ui/screens/user/user_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final model = context.read<UserViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: model.signOut,
        label: Column(
          children: const [
            Text(
              'Exit',
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
          Icons.exit_to_app,
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFFFFF),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        title: const Text(
          "User",
          style: TextStyle(
            color: Color(0xFF000000),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () => model.editUserInformation(context),
            icon: const Icon(
              Icons.edit_rounded,
              color: Color(0xFFF98121),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: const Color(0xFFF98121),
                  width: 2.0,
                ),
              ),
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  user?.photoURL ??
                      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            _UserInformationWidget(user: user),
            const _ResetPasswordButtonWidget(),
            const SizedBox(height: 4.0),
            const _DeleteAccountButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _UserInformationWidget extends StatelessWidget {
  static const List<List<String>> list = [
    ['Ім`я', 'first-name'],
    ['Прізвище', 'last-name'],
    ['День народження', 'birthday'],
    ['Номер телефону', 'phone-number'],
    ['Місто', 'city'],
  ];

  const _UserInformationWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user?.uid)
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
              snapshot.data!.docs;
          var doc = docs[0];
          return Column(
            children: List.generate(
              list.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF98121).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        list[index][0],
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    Text(
                      doc[list[index][1]]as String,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class _ResetPasswordButtonWidget extends StatelessWidget {
  const _ResetPasswordButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<UserViewModel>();
    return ElevatedButton(
      onPressed: model.resetPassword,
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
        'Reset Password',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}


class _DeleteAccountButtonWidget extends StatelessWidget {
  const _DeleteAccountButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<UserViewModel>();
    return ElevatedButton(
      onPressed: model.deleteAccount,
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
        'Delete Account',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
