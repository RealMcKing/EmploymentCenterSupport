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
              Icon(Icons.abc),
              EntrepreneursListWidget(),
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
      InformationExpansionTile(title: "Unemployed status",
          expansionText: 'The status of the unemployed can be obtained: \n1. A person of working age before the appointment of a pension (in particular, on preferential terms or for long service), who, due to the lack of work, does not have earnings or other income provided for by law, is ready and able to start work.'
              '\n2. A person with a disability who has not reached the retirement age established by Article 26 of the Law of Ukraine "On Compulsory State Pension Insurance" and receives a disability pension or social assistance in accordance with the laws of Ukraine "On State Social Assistance to Persons with Disabilities from Childhood and Children with Disabilities" and "On State Social Assistance to Persons Not Entitled to a Pension and Persons with Disabilities".'
              '\n3. A person under the age of 16 who worked and was released due to changes in the organization of production and labor, in particular, the termination or re-profiling of enterprises, institutions and organizations, a reduction in the number (staff) of employees.'
              '\nThe status of the unemployed is granted to the persons indicated in part one of this article upon their personal application (including those submitted by means of electronic identification) in the absence of a suitable job from the first day of registration with the territorial bodies of the central executive body implementing the state policy in the field of employment and labor migration, regardless of the registered place of residence or place of stay.'),
      InformationExpansionTile(
          title: "Rights and obligations of registered unemployed",
          expansionText: 'Registered unemployed are entitled to:'
              '\n1. Free receipt from the territorial bodies of the central executive body implementing the state policy in the field of employment and labor migration:'
              '\n1.1. Job search services and employment assistance, including public and other temporary jobs.'
              '\n1.2. Consulting, information and career guidance services for the purpose of choosing or changing the type of activity (profession). '
          '\n1.3. Information about your rights and obligations as an unemployed person. '
              '\n1.4. Information about yourself contained in the Unified Information and Analytical System:'
              '\n– material security in case of unemployment and social services in accordance with the Law of Ukraine "On Compulsory State Social Insurance in Case of Unemployment" and this Law;'
              '\n- retention of the right to payment of unemployment benefits for the period of participation in public and other temporary works (up to 180 days, in particular in the case of replacing a temporarily absent employee) in the amounts established before they conclude a fixed-term employment contract for participation in such work;'
              '\n– appeals, including to the court, against actions or omissions of state bodies, local governments, enterprises, institutions and organizations, their officials, which led to a violation of the employment rights of a person.'
              '\nRegistered unemployed must:'
              '\n- independently or for the assistance of the territorial bodies of the central executive body implementing the state policy in the field of employment and labor migration, to actively search for work, which consists in taking targeted measures for employment, in particular, taking part in the competitive selection of employers'
              '\n- visit the territorial body of the central executive body implementing the state policy in the field of employment and labor migration, in which he is registered as unemployed at a certain and agreed time, but at least once every thirty calendar days (except for the period of quarantine, established by the Cabinet of Ministers of Ukraine in order to prevent the spread of especially dangerous infectious diseases);'
          '\n– comply with written individual recommendations for promoting employment, including participating in activities related to promoting employment of the population;'
              '\n- inform the territorial body of the central executive body implementing the state policy in the field of employment and labor migration, within three working days, about the circumstances of termination of registration, as defined in the first part of Article 45 of this Law.'),
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
        childrenPadding:
        const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
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
