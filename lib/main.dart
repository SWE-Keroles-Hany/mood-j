import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/bloc_observer.dart';
import 'package:moodly_j/core/routes/app_routes.dart';
import 'package:moodly_j/core/service_locator/get_it.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/home/presentation/home_screen.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/screens/on_boarding_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  setup();
  runApp(
    BlocProvider(create: (_) => getIt<MoodsCubit>(), child: const MyApp()),
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
