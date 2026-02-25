
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_screen.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'history_screen.dart';
import 'add_reminder_screen.dart';
import 'alarm_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  runApp(const RemedicApp());
}

class RemedicApp extends StatelessWidget {
  const RemedicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remedic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFF5F5F5),
        fontFamily: 'Georgia',
        useMaterial3: true,
      ),
      home: const MainNavigationHost(),
    );
  }
}

class MainNavigationHost extends StatefulWidget {
  const MainNavigationHost({super.key});

  @override
  State<MainNavigationHost> createState() => _MainNavigationHostState();
}

class _MainNavigationHostState extends State<MainNavigationHost> {
  String _currentScreen = 'splash';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0: _currentScreen = 'home'; break;
        case 1: _currentScreen = 'history'; break;
        case 2: _currentScreen = 'add'; break;
        case 3: _currentScreen = 'settings'; break;
        case 4: _currentScreen = 'profile'; break;
      }
    });
  }

  void _navigateTo(String screenName) {
    setState(() {
      _currentScreen = screenName;
      if (screenName == 'home') {
        _selectedIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    bool showNav = true;

    switch (_currentScreen) {
      case 'splash':
        return SplashScreen(onFinished: () => _navigateTo('login'));

      case 'login':
        return LoginScreen(onLogin: () => _navigateTo('home'));

      case 'alarm':
        return AlarmScreen(onClose: () => _navigateTo('home'));

      case 'home':
        body = HomeScreen(onTriggerAlarm: () => _navigateTo('alarm'));
        break;

      case 'history':
        body = const HistoryScreen();
        break;

      case 'add':
        body = AddReminderScreen(onBack: () => _onItemTapped(0));
        showNav = false;
        break;

      case 'settings':
        body = const SettingsScreen();
        break;

      case 'profile':
        body = ProfileScreen(onLogout: () => _navigateTo('login'));
        break;

      default:
        body = HomeScreen(onTriggerAlarm: () => _navigateTo('alarm'));
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: showNav ? _buildGlobalNav() : null,
    );
  }

  Widget _buildGlobalNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: Colors.grey[900]!, width: 0.5)),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFFF5F5F5),
        unselectedItemColor: Colors.grey[700],
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History'
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFF5F5F5),
              child: Icon(Icons.add, color: Colors.black),
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Settings'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile'
          ),
        ],
      ),
    );
  }
}
