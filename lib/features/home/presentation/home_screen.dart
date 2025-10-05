import 'package:flutter/material.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/home/presentation/home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final tabs = [HomeTab(), Text("Second"), Text("Second"), Text("Second")];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppTheme.blushPink,
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppTheme.white,
          selectedItemColor: AppTheme.blueAccent,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: "Create",
              icon: Icon(Icons.add_circle_outline_rounded),
            ),
            BottomNavigationBarItem(
              label: "My Journalist",
              icon: Icon(Icons.bookmark_border_rounded),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_2_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
