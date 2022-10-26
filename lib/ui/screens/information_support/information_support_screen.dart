import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecs/ui/screens/information_client/information_client_screen.dart';
import 'package:ecs/ui/screens/information_support/information_support_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
                  'Додаткова інформація',
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
                    Tab(child: Text('Реєстрація в ЦЗ')),
                    Tab(child: Text('Електронні пошти')),
                    Tab(child: Text('Корисні посилання')),
                    Tab(child: Text('Гарячі лінії')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              _EntrepreneursListWidget(),
              _EmailsListsWidget(),
              _UsefulLinksWidget(),
              _HotlineListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HotlineListWidget extends StatelessWidget {
  const _HotlineListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<InformationSupportViewModel>();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('numbers').snapshots(),
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
              return _InformationExpansionTileWidget(
                iconData: Icons.phone,
                information: doc,
                function: () => model.callNumber(doc['phone'].toString()),
                type: 'phone',
              );
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

class _UsefulLinksWidget extends StatelessWidget {
  const _UsefulLinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<InformationSupportViewModel>();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('links').snapshots(),
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
              return _InformationExpansionTileWidget(
                iconData: Icons.link,
                information: doc,
                function: () => model.openLink(doc['link'].toString()),
                type: 'link',
              );
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

class _EmailsListsWidget extends StatelessWidget {
  const _EmailsListsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<InformationSupportViewModel>();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('emails').snapshots(),
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
              return _InformationExpansionTileWidget(
                iconData: Icons.email_outlined,
                information: doc,
                function: () => model.sendMessage(doc['email'].toString()),
                type: 'email',
              );
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
          .where("classification", isEqualTo: "registration")
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

class _InformationExpansionTileWidget extends StatelessWidget {
  final IconData iconData;
  final QueryDocumentSnapshot<Map<String, dynamic>> information;
  final VoidCallback function;
  final String type;

  const _InformationExpansionTileWidget({
    Key? key,
    required this.iconData,
    required this.information,
    required this.function,
    required this.type,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  information['label'].toString(),
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  information[type].toString(),
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.black,
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            mini: true,
            onPressed: function,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Icon(
              iconData,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
