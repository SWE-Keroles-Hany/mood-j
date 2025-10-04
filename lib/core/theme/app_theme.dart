import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color white = Color(0xffF6F7F8);
  static const Color black = Color(0xff1F2937);
  static const Color blue = Color(0xff42B6F1);
  static const Color grey = Colors.grey;
  static const Color blueAccent = Colors.blueAccent;
  static const Color amber = Colors.amber;

  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: black,
        fontWeight: FontWeight.bold,
        fontSize: 30.sp,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        color: const Color.fromARGB(255, 138, 118, 118),
      ),
      titleSmall: TextStyle(fontSize: 16.sp, color: amber),
    ),
  );
}
