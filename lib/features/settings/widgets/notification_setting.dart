import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.subTitle,
    required this.title,
    // required this.reminderMe,
  });
  final String title;
  final String subTitle;
  final ValueNotifier<bool>? controller;
  final void Function(dynamic)? onChanged;
  // final bool reminderMe;
  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  TimeOfDay? time = TimeOfDay(hour: 20, minute: 0);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 18.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.title,
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  AdvancedSwitch(
                    onChanged: widget.onChanged,
                    controller: widget.controller,
                    activeColor: AppTheme.blue,
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    width: 63.w,
                    height: 22.h,
                    enabled: true,
                    disabledOpacity: 0.5.r,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
