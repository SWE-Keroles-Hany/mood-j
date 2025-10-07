import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:moodly_j/core/our_emojis.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/add_mood/presentation/screens/add_mood_screen.dart';
import 'package:moodly_j/features/home/widgets/custom_button.dart';
import 'package:moodly_j/features/home/widgets/custom_item.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // get a emoji by its name
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12.h),
          Text(
            "Your Mood Journey",
            style: textTheme.titleLarge!.copyWith(fontSize: 25.sp),
          ),
          SizedBox(height: 12.h),
          Text("Hello, Keroles", style: textTheme.titleMedium),
          SizedBox(height: 12.h),
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

          SizedBox(height: 14.h),
          SizedBox(
            height: 250.h,
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
              ),
              children: [
                CustomItem(
                  emoji: OurEmojis.sad,
                  icon: "assets/icons/book.png",
                  bgColor: AppTheme.lavender,
                  color: AppTheme.deepPurple,
                  result: "120",
                  title: "Total Entries",
                ),
                CustomItem(
                  fixedIcon: false,
                  emoji: OurEmojis.angry,
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
                  emoji: OurEmojis.calm,
                  bgColor: AppTheme.mintGreen,
                  color: AppTheme.forestGreen,
                  result: "Calm",
                  title: "Today's Mood",
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          CustomButton(
            bgColor: AppTheme.lightBlue,
            color: AppTheme.leafGreen,
            icon: Icons.add_box_outlined,
            onPressed: () {
              Navigator.of(context).pushNamed(AddMoodScreen.routeName);
            },
            title: "Add Mood",
          ),
          SizedBox(height: 12.h),
          CustomButton(
            bgColor: AppTheme.mintGreen,
            color: AppTheme.forestGreen,
            icon: Icons.emoji_emotions,
            onPressed: () {},
            title: "Check Mood",
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: CustomButton(
          //         bgColor: AppTheme.lightBlue,
          //         color: AppTheme.leafGreen,
          //         icon: Icons.add_box_outlined,
          //         onPressed: () {},
          //         title: "Add Mood",
          //       ),
          //     ),
          //     SizedBox(width: 5.w),
          //     Expanded(
          //       child: CustomButton(
          //         bgColor: AppTheme.mintGreen,
          //         color: AppTheme.forestGreen,
          //         icon: Icons.emoji_emotions,
          //         onPressed: () {},
          //         title: "Check Mood",
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 5.h),
          // Text(
          //   "Last 7 Days",
          //   style: textTheme.titleMedium!.copyWith(
          //     color: AppTheme.black,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(height: 5.h),
          // Container(
          //   padding: EdgeInsets.all(4.r),
          //   decoration: BoxDecoration(
          //     color: AppTheme.grey,
          //     borderRadius: BorderRadius.circular(20.r),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       DayMood(day: "Sat", emoji: sad),
          //       DayMood(day: "Sun", emoji: sad),
          //       DayMood(day: "Mon", emoji: sad),
          //       DayMood(day: "Tue", emoji: sad),
          //       DayMood(day: "Wed", emoji: sad),
          //       DayMood(day: "Thu", emoji: sad),
          //       DayMood(day: "Fri", emoji: sad),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
