import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeelingInputField extends StatelessWidget {
  const FeelingInputField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextField(
      autofocus: true,
      controller: controller,
      maxLines: 8,
      decoration: InputDecoration(
        hintStyle: textTheme.titleMedium,
        hintText: "How Are You Feeling today",
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
