import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:moodly_j/core/our_emojis.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/presentation/screens/add_mood_screen.dart';
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

          SizedBox(height: 20.h),
          SizedBox(
            height: 290.h,
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // childAspectRatio: 1,
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
          // SizedBox(height: 15.h),
          CustomButton(
            bgColor: AppTheme.lightBlue,
            color: AppTheme.leafGreen,
            icon: Icons.add_box_outlined,
            onPressed: () {
              Navigator.of(context).pushNamed(AddMoodScreen.routeName);
            },
            title: "Add Mood",
          ),
        ],
      ),
    );
  }
}
