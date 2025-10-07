// import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/our_emojis.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/presentation/widgets/journal_item.dart';

class JournalistTab extends StatelessWidget {
  const JournalistTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Your Journal Moods",
            style: textTheme.titleMedium!.copyWith(
              color: AppTheme.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          ),
          SizedBox(height: 14.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 14.h),
              itemCount: 20,
              itemBuilder: (context, index) => JournalItem(
                description: "-----------",
                emoji: OurEmojis.happy.toString(),
                date: DateTime.now(),
              ),
            ),
          ),
        ],
      ),
      // child: ListView.builder(itemBuilder: ()=>),
    );
  }
}
