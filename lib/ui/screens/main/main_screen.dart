import 'package:ecs/domain/factory/screen_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final _screenFactory = ScreenFactory();

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFFFFF),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _screenFactory.makeVacationList(),
          _screenFactory.makeInformation(),
          _screenFactory.makeResume(),
          _screenFactory.makeUser(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
        elevation: 0,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
            color: Color.fromRGBO(249, 129, 33, 1), size: 30.0),
        unselectedIconTheme: const IconThemeData(
            color: Color.fromRGBO(130, 130, 130, 1), size: 24.0),
        selectedItemColor: const Color.fromRGBO(249, 129, 33, 1),
        unselectedItemColor: const Color.fromRGBO(130, 130, 130, 1),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Вакансії',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_device_information_rounded),
            label: 'Інформація',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_style_outlined),
            label: 'Резюме',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'Користувач',
          ),
        ],
      ),
    );
  }
}
