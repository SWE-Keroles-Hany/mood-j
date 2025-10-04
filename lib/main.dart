import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/routes/app_routes.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: OnBoardingScreen.routeName,
        routes: AppRoutes.routes,
        theme: AppTheme.lightTheme,
      ),
      designSize: Size(360, 640),
      ensureScreenSize: true,
      minTextAdapt: true,
    );
  }
}
