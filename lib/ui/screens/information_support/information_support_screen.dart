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
                  'Additional Information',
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
              EntrepreneursListWidget(),
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
      InformationExpansionTile(
          title: "Slaves Region #1", expansionText: '+38000000000'),
      InformationExpansionTile(
          title: "Slaves Region #2", expansionText: 'Text ne 2'),
      InformationExpansionTile(
          title: "Slaves Region #3", expansionText: 'Text ne 3'),
      InformationExpansionTile(
          title: "Slaves Region #4", expansionText: 'Text ne 4'),
      InformationExpansionTile(
          title: "Slaves Region #5", expansionText: 'Text ne 5'),
      InformationExpansionTile(
          title: "Slaves Region #6", expansionText: 'Text ne 6'),
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

class EntrepreneursListWidget extends StatelessWidget {
  const EntrepreneursListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const informationList = [
      InformationExpansionTile(
          title: "Who can get the status of unemployed",
          expansionText:
              'All unemployed citizens who are ready to work, as well as employed citizens who want to change their place of work, find a part-time job or in their free time can apply to the State Employment Service for assistance in finding employment. Registration of the unemployed who apply for employment assistance is carried out by the employment center, regardless of the registered place of residence or stay.'
              '\nAccording to the first part of Article 43 of the Law of Ukraine “On Employment of the Population” (hereinafter referred to as the Law) , the status of the unemployed can be received by:'
              '\n– a person of working age before the appointment of a pension (in particular, on preferential terms or for long service), who, due to the lack of work, does not have earnings or other income provided for by law, is ready and able to start work;'
              '\n– a person with a disability who has not reached the retirement age established by Article 26 of the Law of Ukraine “On Compulsory State Pension Insurance” and receives a disability pension or social assistance in accordance with the laws of Ukraine “On State Social Assistance to Persons with Disabilities from Childhood and Children with Disabilities” and “On State Social Benefits for Persons Not Entitled to a Pension and Persons with Disabilities”; '
              '\n- a person under the age of 16 who worked and was released due to changes in the organization of production and labor, in particular, the termination or re-profiling of enterprises, institutions and organizations, a reduction in the number (staff) of employees.'
              '\nThe status of the unemployed is granted to the persons indicated in part one of this article upon their personal application (including those submitted by means of electronic identification) in the absence of a suitable job from the first day of registration with the territorial bodies of the central executive body implementing the state policy in the field of employment and labor migration, regardless of the registered place of residence or place of stay.'
              '\nAccording to part 51 of section XI of the Law, for the period of quarantine, the status of unemployed is granted without presenting requirements for the presence of a suitable job.)',),
    ];
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemBuilder: (BuildContext context, int index) {
        return InformationExpansionTileWidgetSecond(
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

class InformationExpansionTileWidgetSecond extends StatelessWidget {
  final InformationExpansionTile informationList;

  const InformationExpansionTileWidgetSecond({
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
