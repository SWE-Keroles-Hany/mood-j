import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/l10n/app_localizations.dart';

// ignore: must_be_immutable
class CustomInputField extends StatelessWidget {
  CustomInputField({
    super.key,
    required this.validator,
    required this.nameController,
  });
  String? Function(String?)? validator;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: nameController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.w, color: AppTheme.blue),
          borderRadius: BorderRadius.circular(22.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.w, color: AppTheme.blue),
          borderRadius: BorderRadius.circular(22.r),
        ),
        label: Text(
          AppLocalizations.of(context)!.enterYourName,
          style: TextStyle(color: AppTheme.black),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2.w, color: AppTheme.blue),
          borderRadius: BorderRadius.circular(22.r),
        ),
      ),
    );
  }
}
