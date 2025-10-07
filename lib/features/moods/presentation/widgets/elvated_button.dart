import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';

class ElvatedButton extends StatelessWidget {
  const ElvatedButton({
    super.key,
    required this.controller,
    required this.title,
    required this.onPressed,
  });
  final TextEditingController controller;
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.blue,
        fixedSize: Size(290.w, 40.h),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
          color: AppTheme.black,
        ),
      ),
    );
  }
}
