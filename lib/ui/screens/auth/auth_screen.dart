import 'package:flutter/material.dart';

import 'package:ecs/domain/factory/screen_factory.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final _screenFactory = ScreenFactory();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 0,
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
                  Tab(child: Text('Login')),
                  Tab(child: Text('Sign Up')),
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
                            const Offset(0, 5), // changes position of shadow
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
                            'Other authorization options',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton.icon(
                            onPressed: () {final snackBar = SnackBar(
                              content: Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF4E8D7C),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      "Excellent",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'You were able to log in with the help of Tim Cook',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
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
                            icon: const Icon(Icons.apple_rounded),
                            label: const Text(
                              'Sign In',
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
