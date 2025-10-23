import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
// import 'package:moodly_j/features/home/presentation/home_screen.dart';
// import 'package:moodly_j/features/moods/presentation/widgets/elvated_button.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/widgets/start_bottom_sheet.dart';
// import 'package:moodly_j/features/settings/widgets/notification_setting.dart';
// import 'package:moodly_j/features/settings/widgets/settign_item_lable.dart';
// import '../widgets/custom_input_field.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "OnBoardingScreen";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool reminderSelected = false;
  String reminder = "Off";
  final notificationController = ValueNotifier<bool>(true);
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.white,
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Text("Welcome to MoodJ", style: textStyle.titleLarge),
              SizedBox(height: 30.h),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16.r),
                child: Image.asset("assets/images/first-img.jpg", width: 320.w),
              ),
              SizedBox(height: 30.h),
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
                  startBottomSheet(
                    context: context,
                    controller: notificationController,
                    dailyReminder: dailyReminder,
                    globalKey: _globalKey,
                    nameController: nameController,
                    reminderSelected: reminderSelected,
                  );
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

  void dailyReminder(dynamic value) {
    setState(() {
      reminderSelected = !reminderSelected;
      if (reminderSelected) {
        reminder = "Off";
      } else {
        reminder = "On";
      }
    });
  }
}
