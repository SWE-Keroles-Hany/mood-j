import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMood extends StatelessWidget {
  const CustomMood({
    this.backgroundColor,
    required this.onPressed,
    required this.emoji,
    super.key,
  });
  final String emoji;
  final Function()? onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0.r),
        backgroundColor: backgroundColor,
        shape: CircleBorder(),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(emoji, style: TextStyle(fontSize: 30.sp)),
      ),
    );
  }
}
