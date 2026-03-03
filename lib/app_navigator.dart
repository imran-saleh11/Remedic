import 'package:flutter/material.dart';
import 'package:remedic/app/home_screen.dart';
import 'package:remedic/app/history_screen.dart';
import 'package:remedic/app/add_reminder.dart';
import 'package:remedic/app/settings_screen.dart';
import 'package:remedic/app/profile_screen.dart';

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
    AddReminderScreen(),
    SettingsScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    //body: _screens[_selectedIndex],
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          labelPadding: EdgeInsetsGeometry.directional(bottom: 12),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.black,
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
            Tab(icon: Icon(Icons.directions_boat)),
          ],
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_boat),
          ],
        ),
      ),
    );
  }
}
