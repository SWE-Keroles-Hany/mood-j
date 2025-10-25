import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/service_locator/get_it.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/home/presentation/home_tab.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/moods/presentation/widgets/journalist_tab.dart';
import 'package:moodly_j/features/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<StatefulWidget> tabs = [HomeTab(), JournalistTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: AppTheme.blue,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: AppTheme.white,
            selectedItemColor: AppTheme.darkBrown,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              if (value == 0) {
                getIt<MoodsCubit>().getMoodToday();
                getIt<MoodsCubit>().getAllMoods();
                getIt<MoodsCubit>().getMostFrequentMood();
                getIt<MoodsCubit>().getWritingStreak();
              }
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                label: "My Journalist",
                icon: Icon(Icons.bookmark_border_rounded),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
