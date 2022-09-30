import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InformationSupportScreen extends StatelessWidget {
  const InformationSupportScreen({Key? key}) : super(key: key);

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
                    Tab(child: Text('Registration')),
                    Tab(child: Text('Emails')),
                    Tab(child: Text('Useful links')),
                    Tab(child: Text('Hotlines')),
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
              InformationBlockWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationBlockWidget extends StatelessWidget {
  const InformationBlockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const informationList = [
      InformationExpansionTile(title: "Slaves Region #1", expansionText: '+38000000000'),
      InformationExpansionTile(title: "Slaves Region #2", expansionText: 'Text ne 2'),
      InformationExpansionTile(title: "Slaves Region #3", expansionText: 'Text ne 3'),
      InformationExpansionTile(title: "Slaves Region #4", expansionText: 'Text ne 4'),
      InformationExpansionTile(title: "Slaves Region #5", expansionText: 'Text ne 5'),
      InformationExpansionTile(title: "Slaves Region #6", expansionText: 'Text ne 6'),
    ];
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemBuilder: (BuildContext context, int index) {
        return InformationExpansionTileWidget(
          informationList: informationList[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
      itemCount: informationList.length,
    );
  }
}

class InformationExpansionTileWidget extends StatelessWidget {
  final InformationExpansionTile informationList;

  const InformationExpansionTileWidget({
    Key? key,
    required this.informationList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF98121).withOpacity(0.12),
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                informationList.title,
                style: const TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              Text(
                informationList.expansionText,
                style: const TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          FloatingActionButton(
            backgroundColor: Colors.black,
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            mini: true,
            onPressed: () {},
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: const Icon(
              Icons.phone_rounded,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}

class InformationExpansionTile {
  final String title;
  final String expansionText;

  const InformationExpansionTile({
    required this.title,
    required this.expansionText,
  });
}
