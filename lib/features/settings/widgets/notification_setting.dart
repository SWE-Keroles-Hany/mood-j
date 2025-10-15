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
    required this.reminderMe,
  });
  final String title;
  final String subTitle;
  final ValueNotifier<bool>? controller;
  final void Function(dynamic)? onChanged;
  final bool reminderMe;
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
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 228, 220, 224),
            borderRadius: BorderRadius.circular(18.r),
          ),
          padding: EdgeInsets.all(12.r),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        widget.subTitle,
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  AdvancedSwitch(
                    onChanged: widget.onChanged,
                    controller: widget.controller,
                    activeColor: AppTheme.blue,
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    width: 60.w,
                    height: 25.h,
                    enabled: true,
                    disabledOpacity: 0.5.r,
                  ),
                ],
              ),

              //! visibile
              Visibility(
                visible: !widget.reminderMe,
                child: Column(
                  children: [
                    Divider(color: AppTheme.black),
                    Row(
                      children: [
                        Text("Remind Me at .."),
                        SizedBox(width: 10.w),
                        Text(time.toString()),
                        Spacer(),
                        IconButton(
                          onPressed: () async {
                            time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.timer,
                            size: 28.r,
                            color: AppTheme.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
