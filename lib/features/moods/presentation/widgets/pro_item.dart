import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';

class ProItem extends StatelessWidget {
  const ProItem({
    required this.icon,
    required this.title,
    super.key,
    this.done = false,
  });
  final IconData icon;
  final String title;
  final bool done;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppTheme.lightBlueGrey,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 35.r, color: AppTheme.blue),
          SizedBox(width: 15.w),
          Text(
            title,
            style: textTheme.titleMedium!.copyWith(
              color: AppTheme.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          done ? Icon(Icons.check, size: 30) : SizedBox(),
        ],
      ),
    );
  }
}
