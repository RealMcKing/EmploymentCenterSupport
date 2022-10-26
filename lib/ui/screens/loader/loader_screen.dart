import 'package:ecs/domain/factory/screen_factory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoaderScreen extends StatelessWidget {
  static final _screenFactory = ScreenFactory();

  const LoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _screenFactory.makeMain();
          } else {
            return _screenFactory.makeAuth();
          }
        },
      ),

      // backgroundColor: const Color(0xFFfae2cf),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   toolbarHeight: 0,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Color(0xFFfae2cf),
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarBrightness: Brightness.dark,
      //   ),
      // ),
      // body: const Center(
      //   child: SizedBox(
      //     width: 96,
      //     height: 96,
      //     child: RiveAnimation.asset(
      //       'assets/animation/loading.riv',
      //     ),
      //   ),
      // ),
    );
  }
}
