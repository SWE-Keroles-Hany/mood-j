import 'package:flutter/material.dart';
import 'package:moodly_j/core/theme/app_theme.dart';

class FeatureLable extends StatelessWidget {
  const FeatureLable({required this.lable, super.key});
  final String lable;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      lable,
      style: textTheme.titleMedium!.copyWith(
        color: AppTheme.black,

        fontWeight: FontWeight.bold,
      ),
    );
  }
}
