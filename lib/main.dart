import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/bloc_observer.dart';
import 'package:moodly_j/core/routes/app_routes.dart';
import 'package:moodly_j/core/service_locator/get_it.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_cubit.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/init_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MoodsCubit>()
            ..getMoodToday()
            ..getMostFrequentMood()
            ..getWritingStreak()
            ..getAllMoods(),
        ),
        BlocProvider(
          create: (context) => getIt<UserCubit>()
            ..isUserCreated()
            ..getUser(),
        ),
      ],
      child: const MoodJApp(),
    ),
  );
}

class MoodJApp extends StatelessWidget {
  const MoodJApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(360, 640),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: InitScreen.routeName,
        routes: AppRoutes.routes,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
