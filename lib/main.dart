import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/routes/app_routes.dart';
import 'package:moodly_j/core/service_locator/get_it.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/home/presentation/home_screen.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/on_boarding_screen.dart';

void main() {
  setup();
  runApp(
    BlocProvider(
      create: (_) => getIt<MoodsCubit>()..getAllMoods(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: AppRoutes.routes,
        theme: AppTheme.lightTheme,
      ),
      designSize: Size(360, 640),
      ensureScreenSize: true,
      minTextAdapt: true,
    );
  }
}
