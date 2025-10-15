import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/settings/widgets/notification_setting.dart';
import 'package:moodly_j/features/settings/widgets/settign_item_lable.dart';
import 'package:moodly_j/features/settings/widgets/setting_item.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final themeController = ValueNotifier<bool>(true);
  final notificationController = ValueNotifier<bool>(true);
  final lanaugeController = ValueNotifier<bool>(true);

  //! Theme Variables
  bool lightSelected = true;
  String theme = "Light";
  //! Reminder Variables
  bool reminderSelected = false;
  String reminder = "Off";
  //! Reminder Variables
  bool languageSelected = false;
  String language = "English";
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          //! Settings
          Text(
            textAlign: TextAlign.center,
            "Settings",
            style: textTheme.titleMedium!.copyWith(
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.black,
            ),
          ),
          SizedBox(height: 18.h),
          //! Apperance
          SettignItemLable(title: "Apperance"),
          SizedBox(height: 5.h),
          SettingItem(
            controller: themeController,
            onChanged: onThemeChange,
            subTitle: theme,
            title: "Theme",
          ),

          //! Apperance
          SizedBox(height: 15.h),
          //! Apperance
          SettignItemLable(title: "Language"),
          SizedBox(height: 5.h),
          SettingItem(
            controller: lanaugeController,
            onChanged: onLanguageChange,
            subTitle: language,
            title: "Language",
          ),
          SizedBox(height: 15.h),

          SettignItemLable(title: "Daily Reminder"),
          SizedBox(height: 5.h),
          NotificationSetting(
            reminderMe: reminderSelected,
            controller: notificationController,
            onChanged: dailyReminder,
            subTitle: "Notification",
            title: "Daily Reminder",
          ),
        ],
      ),
    );
  }

  void onThemeChange(dynamic value) {
    setState(() {
      lightSelected = !lightSelected;
      if (lightSelected) {
        theme = "Light";
      } else {
        theme = "Dark";
      }
    });
  }

  void onLanguageChange(dynamic value) async {
    setState(() {
      languageSelected = !languageSelected;
      if (languageSelected) {
        language = "English";
      } else {
        language = "Arabic";
      }
    });
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
