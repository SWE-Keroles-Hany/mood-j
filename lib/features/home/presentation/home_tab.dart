import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/home/widgets/custom_button.dart';
import 'package:moodly_j/features/home/widgets/custom_item.dart';
import 'package:emojis/emoji.dart';
import 'package:moodly_j/features/home/widgets/day_mood.dart'; // to use Emoji utilities

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  Emoji angry = Emoji.byChar(Emojis.poutingFace)!; // 😡
  Emoji bullying = Emoji.byChar(Emojis.smirkingFace)!; // 😏
  Emoji sad = Emoji.byChar(Emojis.cryingFace)!; // 😢
  Emoji happy = Emoji.byChar(Emojis.smilingFaceWithSmilingEyes)!; // 😊
  Emoji excited = Emoji.byChar(Emojis.starStruck)!; // 🤩
  Emoji calm = Emoji.byChar(Emojis.relievedFace)!; // 😌

  @override
  Widget build(BuildContext context) {
    // get a emoji by its name
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 6.h),
          Text(
            "Your Mood Journey",
            style: textTheme.titleLarge!.copyWith(fontSize: 25.sp),
          ),
          SizedBox(height: 6.h),
          Text("Hello, Keroles", style: textTheme.titleMedium),
          SizedBox(height: 6.h),
          ListTile(
            selected: true,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
            selectedTileColor: AppTheme.creamYellow,
            title: Text(
              "Don't Forget To Write Today!",
              style: textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.darkBrown,
              ),
            ),
            leading: Icon(FluentIcons.pen_16_filled),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  bgColor: AppTheme.lightBlue,
                  color: AppTheme.leafGreen,
                  icon: Icons.add_box_outlined,
                  onPressed: () {},
                  title: "Add Mood",
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: CustomButton(
                  bgColor: AppTheme.mintGreen,
                  color: AppTheme.forestGreen,
                  icon: Icons.emoji_emotions,
                  onPressed: () {},
                  title: "Check Mood",
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            // color: Colors.red,
            height: 320,
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.18,
              ),
              children: [
                CustomItem(
                  emoji: sad,
                  icon: "assets/icons/book.png",
                  bgColor: AppTheme.lavender,
                  color: AppTheme.deepPurple,
                  result: "120",
                  title: "Total Entries",
                ),
                CustomItem(
                  fixedIcon: false,
                  emoji: sad,
                  // icon: "assets/icons/book.png",
                  bgColor: AppTheme.creamYellow,
                  color: AppTheme.darkBrown,
                  result: "Happy",
                  title: "Most Frequent",
                ),
                CustomItem(
                  icon: "assets/icons/fire.png",
                  bgColor: AppTheme.lightPink,
                  color: AppTheme.deepRose,
                  result: "7 Days",
                  title: "Writing Streak",
                ),
                CustomItem(
                  fixedIcon: false,
                  emoji: calm,
                  bgColor: AppTheme.mintGreen,
                  color: AppTheme.forestGreen,
                  result: "Calm",
                  title: "Today's Mood",
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "Last 7 Days",
            style: textTheme.titleMedium!.copyWith(
              color: AppTheme.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              color: AppTheme.grey,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DayMood(day: "Sat", emoji: sad),
                DayMood(day: "Sun", emoji: sad),
                DayMood(day: "Mon", emoji: sad),
                DayMood(day: "Tue", emoji: sad),
                DayMood(day: "Wed", emoji: sad),
                DayMood(day: "Thu", emoji: sad),
                DayMood(day: "Fri", emoji: sad),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
