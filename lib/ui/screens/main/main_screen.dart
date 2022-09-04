import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app_outlined),
            color: const Color.fromRGBO(249, 129, 33, 1),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(242, 242, 242, 48),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'US jobs growth disappoints as recovery falters',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Nature Channel',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(249, 129, 33, 1),
                              ),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: '4 min ago',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(196, 196, 196, 1),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 10,
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
              child: const Text(
                'Press',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Input',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(111, 119, 137, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                filled: true,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                fillColor: const Color.fromRGBO(242, 242, 242, 0.48),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 73,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
          selectedItemColor: const Color.fromRGBO(249, 129, 33, 1),
          unselectedItemColor: const Color.fromRGBO(130, 130, 130, 1),
          selectedLabelStyle: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w400,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Вакансії',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Інформація',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Резюме',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Кабінет',
            ),
          ],
        ),
      ),
    );
  }
}
