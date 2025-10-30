import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/l10n/app_localizations.dart';

class FeelingInputField extends StatelessWidget {
  const FeelingInputField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context)!;

    return TextField(
      // autofocus: true,
      controller: controller,
      maxLines: 8,
      decoration: InputDecoration(
        hintStyle: textTheme.titleMedium,
        hintText: localization.howAreYouFeelingToday,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
