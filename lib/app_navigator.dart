import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'app/home_screen.dart';
import 'app/history_screen.dart';
import 'app/add_reminder.dart';
import 'app/settings_screen.dart';
import 'app/profile_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    HistoryScreen(),
    SettingsScreen(),
    ProfileScreen(),
    AddReminderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        _screens[_selectedIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 40,
                right: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0 ? Colors.white : const Color(0x31A8A8A8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          FontAwesomeIcons.solidHouse,
                          color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                          size: 30
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1 ? Colors.white : const Color(0x31A8A8A8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          Icons.article_rounded,
                          color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                          size: 32
                        ),
                      ),
                    ),
                    SizedBox(width: 65),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 2 ? Colors.white : const Color(0x31A8A8A8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          FontAwesomeIcons.sliders,
                          color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                          size: 30
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 3 ? Colors.white : const Color(0x31A8A8A8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          FontAwesomeIcons.solidCircleUser,
                          color: _selectedIndex == 3 ? Colors.black : Colors.grey,
                          size: 30
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 4;
                    });
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 60,
                    width: 70,
                    margin: const EdgeInsetsGeometry.directional(start: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: _selectedIndex == 4 ? Colors.white : const Color(0x31A8A8A8),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 35,
                      color: _selectedIndex == 4 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}