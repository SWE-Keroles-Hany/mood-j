import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/home/presentation/home_screen.dart';
import 'package:moodly_j/features/moods/presentation/widgets/elvated_button.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/widgets/custom_input_field.dart';
import 'package:moodly_j/features/settings/widgets/notification_setting.dart';

Future<dynamic> startBottomSheet({
  required BuildContext context,
  required GlobalKey<FormState> globalKey,
  required TextEditingController nameController,
  required ValueNotifier<bool>? controller,
  required bool reminderSelected,
  required Function(dynamic) dailyReminder,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.blushPink,
            borderRadius: BorderRadius.circular(22.r),
          ),
          padding: EdgeInsets.all(16.r),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomInputField(
                    validator: (input) {
                      if (input == null || input.isEmpty || input.length < 3) {
                        return "Invalid Name";
                      }
                      return null;
                    },
                    nameController: nameController,
                  ),
                  SizedBox(height: 20.h),
                  NotificationSetting(
                    reminderMe: reminderSelected,
                    controller: controller,
                    onChanged: dailyReminder,
                    subTitle: "Notification",
                    title: "Daily Reminder",
                  ),
                  SizedBox(height: 20.h),
                  ElvatedButton(
                    title: "Go",
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(HomeScreen.routeName);
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
