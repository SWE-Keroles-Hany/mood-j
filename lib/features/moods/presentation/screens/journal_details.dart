import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:moodly_j/core/get_emoji.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';
import 'package:moodly_j/features/moods/presentation/widgets/custom_audio_player.dart';

// ignore: must_be_immutable
class JournalDetailsScreen extends StatefulWidget {
  static const routeName = "JournalDetails";
  const JournalDetailsScreen({super.key});

  @override
  State<JournalDetailsScreen> createState() => _JournalDetailsScreenState();
}

class _JournalDetailsScreenState extends State<JournalDetailsScreen> {
  DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  bool isLoaded = false;
  bool isExist = false;
  MoodEntity? mood;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      mood = ModalRoute.of(context)!.settings.arguments as MoodEntity;
      pathExist();
      isLoaded = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffE7E7F1),
      appBar: AppBar(
        title: Text(
          "Your Mood",
          style: textTheme.titleMedium!.copyWith(color: AppTheme.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.r),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: const Color(0xffF4F4F9),
          ),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                getEmoji(mood!.emoji, context).$1.toString(),
                style: TextStyle(fontSize: 60.sp),
              ),
              Text(
                textAlign: TextAlign.center,
                dateFormat.format(mood?.moodDate ?? DateTime.now()),
                style: textTheme.titleMedium!.copyWith(
                  color: AppTheme.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 20.h),
              _buildImage(),

              SizedBox(height: 20.h),

              Text(
                mood?.description ?? "",
                style: textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              if (mood?.audioPath != null &&
                  File(mood?.audioPath ?? "").existsSync())
                CustomAudioPlayer(recorededFile: File(mood?.audioPath ?? ""))
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void pathExist() async {
    if (mood?.imgPath != null && File(mood?.imgPath ?? "").existsSync()) {
      isExist = true;
      setState(() {});
    } else {
      isExist = false;
    }
  }

  Widget _buildImage() {
    if (!isExist) return const SizedBox();
    if (!isLoaded) return const Center(child: CircularProgressIndicator());

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.file(File(mood?.imgPath ?? ""), fit: BoxFit.cover),
    );
  }
}
