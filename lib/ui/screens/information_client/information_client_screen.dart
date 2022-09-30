import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InformationClientScreen extends StatelessWidget {
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
              EntrepreneursListWidget(),
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

class EntrepreneursListWidget extends StatelessWidget {
  const EntrepreneursListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const informationList = [
      InformationExpansionTile(title: "Text 1", expansionText: 'Text ne 1'),
      InformationExpansionTile(title: "Text 2", expansionText: 'Text ne 2'),
      InformationExpansionTile(title: "Text 3", expansionText: 'Text ne 3'),
      InformationExpansionTile(title: "Text 4", expansionText: 'Text ne 4'),
      InformationExpansionTile(title: "Text 5", expansionText: 'Text ne 5'),
      InformationExpansionTile(title: "Text 6", expansionText: 'Text ne 6'),
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
    return Card(
      shadowColor: Colors.transparent,
      color: const Color(0xFFF98121).withOpacity(0.12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        collapsedIconColor: const Color(0xFFF98121),
        iconColor: const Color(0xFFF98121),
        expandedAlignment: Alignment.topLeft,
        childrenPadding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
        title: Text(
          informationList.title,
          style: const TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        children: [
          Text(
            informationList.expansionText,
            style: const TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
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
