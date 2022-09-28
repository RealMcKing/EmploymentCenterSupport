import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecs/domain/factory/screen_factory.dart';

class InformationClientScreen extends StatelessWidget {
  static final _screenFactory = ScreenFactory();

  const InformationClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, value) {
            return [
              const SliverAppBar(
                centerTitle: true,
                title: Text(
                  'For clients of the EC',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                  ),
                ),
                iconTheme: IconThemeData(
                  color: Color(0xFFF98121),
                ),
                backgroundColor: Color(0xFFFFFFFF),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFFFFFFFF),
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,
                ),
                elevation: 0,
                pinned: true,
                snap: false,
                floating: true,
                bottom: TabBar(
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
                    Tab(child: Text('For entrepreneurs')),
                    Tab(child: Text('For unemployed')),
                    Tab(child: Text('For invalids')),
                    Tab(child: Text('For combatants')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Icon(Icons.abc),
              Icon(Icons.abc),
              Icon(Icons.abc),
              Icon(Icons.abc),
            ],
          ),
        ),
      ),
    );
  }
}
