import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';

class SettignItemLable extends StatelessWidget {
  const SettignItemLable({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: textTheme.titleMedium!.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppTheme.black,
      ),
    );
  }
}
