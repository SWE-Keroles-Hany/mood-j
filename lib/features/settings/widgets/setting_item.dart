import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';

// ignore: must_be_immutable
class SettingItem extends StatefulWidget {
  SettingItem({
    super.key,
    required this.onChanged,
    required this.subTitle,
    required this.title,
    required this.controller,
  });
  void Function(dynamic)? onChanged;
  final String title;
  final String subTitle;
  final ValueNotifier<bool> controller;
  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 231, 238),
            borderRadius: BorderRadius.circular(18.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 6.r),
          child: Row(
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
                width: 55.w,
                height: 20.h,
                enabled: true,
                disabledOpacity: 0.5.r,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
