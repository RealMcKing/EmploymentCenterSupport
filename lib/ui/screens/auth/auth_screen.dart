import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:ecs/ui/screens/auth/auth_model.dart';
import 'package:ecs/domain/factory/screen_factory.dart';

class AuthScreen extends StatelessWidget {
  static final _screenFactory = ScreenFactory();

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthViewModel>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFFFFFFFF),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: const Color(0xFFFFFFFF),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.only(
                  bottom: 8.0,
                  left: 2.0,
                  right: 2.0,
                ),
                labelColor: Color(0xFF000000),
                unselectedLabelColor: Color(0xFFC4C4C4),
                indicatorColor: Color(0xFFF98121),
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                unselectedLabelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                isScrollable: true,
                tabs: [
                  Tab(child: Text('Вхiд')),
                  Tab(child: Text('Реєструватися')),
                ],
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                _screenFactory.makeLogin(),
                _screenFactory.makeSignUp(),
              ],
            ),
            DraggableScrollableSheet(
              minChildSize: 0.11,
              initialChildSize: 0.11,
              maxChildSize: 0.23,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset:
                            const Offset(0, 5),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                    ),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 5,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF98121).withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Інші варіанти авторизації',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton.icon(
                            onPressed: () => model.signInWithGoogle(context),
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
                            icon: SvgPicture.asset(
                              'assets/icons/google.svg',
                              height: 20.0,
                              width: 20.0,
                            ),
                            label: const Text(
                              'Вхiд',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
