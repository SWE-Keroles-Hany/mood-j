import 'package:flutter/material.dart';
import 'package:moodly_j/features/home/presentation/home_screen.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/on_boarding_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
    HomeScreen.routeName: (context) => HomeScreen(),
  };
}
