import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color white = Color(0xffF6F7F8);
  static const Color black = Color(0xff1F2937);
  static const Color blue = Color(0xff42B6F1);
  static const Color grey = Colors.grey;
  static const Color blueAccent = Colors.blueAccent;
  static const Color amber = Colors.amber;
  static const Color darkBrown = Color(0xff7A401E);
  static const Color creamYellow = Color(0xffFCF6CD);
  static const Color lightBlue = Color(0xffDBEAFE);
  static const Color leafGreen = Color(0xff0A29AA);
  static const Color mintGreen = Color(0xffDCFCE7);
  static const Color forestGreen = Color(0xff32743B);
  static const Color lavender = Color(0xffF4E9FD);
  static const deepPurple = Color(0xff510B82);
  static const Color lightPink = Color(0xffFCE8F3);
  static const deepRose = Color(0xff912A4C);
  static const Color blushPink = Color(0xffFAEBF2);
  static const Color lightBlueGrey = Color(0xFFE7EFF3);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,

      backgroundColor: Colors.transparent,
    ),
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
      titleSmall: TextStyle(fontSize: 16.sp, color: black),
    ),
  );
}
