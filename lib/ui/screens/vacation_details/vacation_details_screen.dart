import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VacationDetailsScreen extends StatelessWidget {
  const VacationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.medium(
            centerTitle: true,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xFFFFFFFF),
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
            backgroundColor: const Color(0xFFFFFFFF),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            title: const Text(
              'Middle Flutter Developer',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Experience: 1 to 3 years',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const Text(
                        'Type of employment: Full-time',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const Text(
                        'Salary: 100 000 - 120 000 hrn',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                        ),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF98121).withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'MOYO',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              Text(
                                'Ukraine, Kiev',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        """MOYO is an excellent trade merge, where the Client takes positive emotions for the high level of service and establishes a new service format.
We are praised for the success of any business - these are spivrobitniks. The company creates comfortable conditions for the formation and development of a team of like-minded professionals who strive for self-realization and achievement of corporate goals.
MOYO company is always glad to meet with its team of talented specialists, professional consultants who are ready to respond, ask for non-standard solutions, keep up the pace of the company and move forward. If you respect yourself like this - ask for a team.
Name me in a Flutter Developer Inquiry Response, which is part of our company.
What we offer our specialists:
– We are a reliable company, including the increase of the KZpP, stably and honestly paying wages, paying for medicines, hiring and permits (24 calendar days).
- The company works for its entrepreneurs more lower points. That's why we have
— The daily work schedule of robots is from 09:00 to 18:00, as well as efficient work without breaks and breaks. To the maximum extent individual action is possible;
— Work in a social support company that follows the market trends and appreciates the ideas of analysts.
— An hourly and comfortable office, as well as raw equipment for robots and licensed software.
Our candidate has:
Maєsh commercial dosvid with Flutter from 2 rock;
Knowledge of Dart Core included;
There is practical knowledge of the OOP concept, GUI development, software templates - project, SOLID;
You need to know the Flutter SDK;
Great access to robots with REST API, JSON;
May you see the creation of the basic structure of the appendices;
Insert native part of iOS, Android;
Maesh dosvid razgortannya dodatkov (TestFlight, Play Market);
You can read logs and logs;
Maesh dosvіd creation and adding created additions to the AppStore and Google Play;
Great access to information about control systems and version control: GIT, Gitlab, Jira;
Lord of the successful dosvidom of robots with Figma;
Understanding Agile methodology.
We plan to perform the following tasks for you:
Creation and launch of own mobile applications from scratch;
Exploring new features;
Development of new products and canned food;
Part of the code review process;
If you are interested in joining our team, get the opportunity and send your CV!""",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Column(
          children: const [
            Text(
              'Apply for job',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            Text(
              'Be the first',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w300,
                fontSize: 11.0,
              ),
            ),
          ],
        ),
        icon: const Icon(
          Icons.edit,
          size: 18.0,
          color: Color(0xFFFFFFFF),
        ),
        backgroundColor: const Color(0xFF000000),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
      ),
    );
  }
}
