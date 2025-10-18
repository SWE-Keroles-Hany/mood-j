import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';
import 'package:moodly_j/features/moods/presentation/widgets/custom_audio_player.dart';

// ignore: must_be_immutable
class JournalDetails extends StatelessWidget {
  static const routeName = "JournalDetails";
  DateFormat dateFormat = DateFormat.yMMMMd('en_US');

  JournalDetails({super.key});
  @override
  Widget build(BuildContext context) {
    MoodEntity mood = ModalRoute.of(context)?.settings.arguments as MoodEntity;

    // final player = AudioPlayer();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Mood",
          style: textTheme.titleMedium!.copyWith(color: AppTheme.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              dateFormat.format(mood.moodDate),
              style: textTheme.titleMedium!.copyWith(
                color: AppTheme.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              mood.emoji,
              style: TextStyle(fontSize: 60.sp),
            ),
            SizedBox(height: 20.h),
            (mood.imgPath != null && File(mood.imgPath!).existsSync())
                ? ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12.r),
                    child: Image.file(File(mood.imgPath!), fit: BoxFit.cover),
                  )
                : const SizedBox(),
            SizedBox(height: 20.h),

            Text(
              mood.description,
              style: textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            if (mood.audioPath != null && File(mood.audioPath!).existsSync())
              CustomAudioPlayer(recorededFile: File(mood.audioPath!))
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
