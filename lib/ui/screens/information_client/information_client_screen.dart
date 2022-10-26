import 'package:cloud_firestore/cloud_firestore.dart';
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
                  'Для клієнтів ЦЗ',
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
                    Tab(child: Text('Для підприємців')),
                    Tab(child: Text('Для безробітних')),
                    Tab(child: Text('Для інвалідів')),
                    Tab(child: Text('Для учасників бойових дій')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              _EntrepreneursListWidget(),
              _UnemployedListWidget(),
              _InvalidsListWidget(),
              _CombatantsListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UnemployedListWidget extends StatelessWidget {
  const _UnemployedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('lists')
          .where("classification", isEqualTo: "unemployed")
          .snapshots(),
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
              return InformationExpansionTileWidget(information: doc);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
          );
        }
      },
    );
  }
}

class _InvalidsListWidget extends StatelessWidget {
  const _InvalidsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('lists')
          .where("classification", isEqualTo: "invalids")
          .snapshots(),
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
              return InformationExpansionTileWidget(information: doc);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
          );
        }
      },
    );
  }
}

class _CombatantsListWidget extends StatelessWidget {
  const _CombatantsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('lists')
          .where("classification", isEqualTo: "combatants")
          .snapshots(),
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
              return InformationExpansionTileWidget(information: doc);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
          );
        }
      },
    );
  }
}

class _EntrepreneursListWidget extends StatelessWidget {
  const _EntrepreneursListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('lists')
          .where("classification", isEqualTo: "entrepreneurs")
          .snapshots(),
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
              return InformationExpansionTileWidget(information: doc);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
          );
        }
      },
    );
  }
}

class InformationExpansionTileWidget extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> information;

  const InformationExpansionTileWidget({
    Key? key,
    required this.information,
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
        childrenPadding:
            const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
        title: Text(
          information['label'] as String,
          style: const TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        children: [
          Text(
            information['information'] as String,
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
