import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/home/presentation/home_screen.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "OnBoardingScreen";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16.r),
                child: Image.asset("assets/images/first-img.jpg", width: 320.w),
              ),
              SizedBox(height: 20.h),
              Text("Welcome to MoodJ", style: textStyle.titleLarge),
              SizedBox(height: 16.h),
              Text(
                textAlign: TextAlign.center,
                style: textStyle.titleMedium,
                "Track your moods, reflect on your day, and see your journey over time.",
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(320.w, 45.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.r,
                    vertical: 10.r,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(18.r),
                  ),
                  backgroundColor: AppTheme.blue,
                  foregroundColor: AppTheme.black,
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(HomeScreen.routeName);
                },
                child: Text(
                  "Get Started",
                  style: textStyle.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.white,
                  ),
                ),
              ),
              SizedBox(height: 35.h),
            ],
          ),
        ),
      ),
    );
  }
}
