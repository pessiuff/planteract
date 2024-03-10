import 'package:flutter/material.dart';
import 'package:planteract/pages/plant_page.dart';
import 'package:planteract/pages/remote_page.dart';
import 'package:planteract/pages/settings_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List _pages = [
    const RemotePage(),
    const PlantPage(),
    const SettingsPage()
  ];
  
  int _selectedPageIndex = 0;

  void _navigateToPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedPageIndex],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: const Text('Planteract'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _navigateToPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_remote),
              label: 'Remote',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_florist),
              label: 'Plant',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        )
      )
    );
  }
}
