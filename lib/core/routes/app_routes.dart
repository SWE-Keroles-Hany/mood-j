import 'package:flutter/material.dart';
import 'package:moodly_j/features/moods/presentation/screens/add_mood_screen.dart';
import 'package:moodly_j/features/home/presentation/home_screen.dart';
import 'package:moodly_j/features/moods/presentation/screens/journal_details.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/init_screen.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/screens/on_boarding_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
    AddMoodScreen.routeName: (context) => AddMoodScreen(),
    JournalDetailsScreen.routeName: (context) => JournalDetailsScreen(),

    HomeScreen.routeName: (context) => HomeScreen(),
    InitScreen.routeName: (context) => InitScreen(),
  };
}
