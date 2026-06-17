import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/study_screen.dart';
import 'screens/tech_screen.dart';
import 'screens/sleep_screen.dart';
import 'screens/profile_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('lakshyaBox');

  runApp(const LakshyaJeetApp());
}

class LakshyaJeetApp extends StatelessWidget {
  const LakshyaJeetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lakshya Jeet',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final screens = const [
    HomeScreen(),
    StudyScreen(),
    TechScreen(),
    FinanceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: "Study",
          ),
          NavigationDestination(
            icon: Icon(Icons.computer),
            label: "Tech",
          ),
          NavigationDestination(
            icon: Icon(Icons.bedtime),
            label: "Sleep",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}