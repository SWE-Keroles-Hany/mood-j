import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:moodly_j/core/our_emojis.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/presentation/screens/add_mood_screen.dart';
import 'package:moodly_j/features/home/widgets/custom_button.dart';
import 'package:moodly_j/features/home/widgets/custom_item.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_cubit.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_states.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // get a emoji by its name
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 12.h),
            Text(
              "Your Mood Journey",
              style: textTheme.titleLarge!.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 12.h),
            BlocBuilder<UserCubit, UserStates>(
              builder: (context, state) {
                if (state is SuccessGetUserState) {
                  return Text(
                    "Hello,${state.user.name}",
                    style: textTheme.titleMedium,
                  );
                }
                return SizedBox();
              },
            ),
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
                  fontSize: 18.sp,
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
                  BlocBuilder<UserCubit, UserStates>(
                    builder: (context, state) {
                      if (state is LoadingGetUserState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SuccessGetUserState) {
                        return CustomItem(
                          emoji: OurEmojis.sad,
                          icon: "assets/icons/book.png",
                          bgColor: AppTheme.lavender,
                          color: AppTheme.deepPurple,
                          result: "${state.user.totalMoods}",
                          title: "Total Entries",
                        );
                      } else if (state is ErrorGetUserState) {
                        return const Center(
                          child: Text("Failed to load moods"),
                        );
                      }

                      return const SizedBox();
                    },
                  ),

                  BlocBuilder<UserCubit, UserStates>(
                    builder: (context, state) {
                      if (state is LoadingGetUserState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SuccessGetUserState) {
                        return CustomItem(
                          fixedIcon: false,
                          emoji: getEmoji("Happy"),
                          bgColor: AppTheme.creamYellow,
                          color: AppTheme.darkBrown,
                          result: "${state.user.mostFrequent}",
                          title: "Most Frequent",
                        );
                      } else if (state is ErrorGetUserState) {
                        return const Text("Error");
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocBuilder<UserCubit, UserStates>(
                    builder: (context, state) {
                      if (state is LoadingGetUserState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SuccessGetUserState) {
                        return CustomItem(
                          icon: "assets/icons/fire.png",
                          bgColor: AppTheme.lightPink,
                          color: AppTheme.deepRose,
                          result: "${state.user.writingStreak} Days",
                          title: "Writing Streak",
                        );
                      } else if (state is ErrorGetUserState) {
                        return const Text("Error");
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocBuilder<UserCubit, UserStates>(
                    builder: (context, state) {
                      if (state is LoadingGetUserState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SuccessGetUserState) {
                        return CustomItem(
                          fixedIcon: false,
                          emoji: getEmoji("Happy"),
                          bgColor: AppTheme.mintGreen,
                          color: AppTheme.forestGreen,
                          result: state.user.todayMood ?? "—",
                          title: "Today's Mood",
                        );
                      } else if (state is ErrorGetUserState) {
                        return const Text("Error");
                      }
                      return const SizedBox();
                    },
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
      ),
    );
  }

  Emoji? getEmoji(String res) {
    if (res == "Happy") {
      return OurEmojis.happy;
    } else if (res == "Sad") {
      return OurEmojis.sad;
    } else if (res == "Angry") {
      return OurEmojis.angry;
    } else if (res == "Excited") {
      return OurEmojis.excited;
    } else if (res == "Boring") {
      return OurEmojis.boring;
    }
    return null;
  }
}
