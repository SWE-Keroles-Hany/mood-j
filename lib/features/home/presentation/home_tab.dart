import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:moodly_j/core/service_locator/get_it.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/core/get_emoji.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_states.dart';
import 'package:moodly_j/features/moods/presentation/screens/add_mood_screen.dart';
import 'package:moodly_j/features/home/widgets/custom_button.dart';
import 'package:moodly_j/features/home/widgets/custom_item.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_cubit.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_states.dart';

// ignore: must_be_immutable
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() async {
    final moodsCubit = getIt<MoodsCubit>();
    await moodsCubit.getAllMoods();
    await moodsCubit.getMoodToday();
    await moodsCubit.getMostFrequentMood();
    await moodsCubit.getWritingStreak();
  }

  @override
  Widget build(BuildContext context) {
    // get a emoji by its name
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(22.r),
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
              buildWhen: (_, current) =>
                  current is SuccessGetUserState ||
                  current is ErrorGetUserState ||
                  current is LoadingGetUserState,
              builder: (context, state) {
                print("user state $state");
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
                  fontSize: 16.sp,
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
                  BlocBuilder<MoodsCubit, MoodsStates>(
                    buildWhen: (_, current) =>
                        (current is LoadingGetAllMoodsState ||
                        current is SuccessGetAllMoodsState ||
                        current is ErrorGetAllMoodsState),
                    builder: (context, state) {
                      if (state is LoadingGetAllMoodsState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SuccessGetAllMoodsState) {
                        return CustomItem(
                          icon: "assets/icons/book.png",
                          bgColor: AppTheme.lavender,
                          color: AppTheme.deepPurple,
                          result: "${state.allMoods.length}",
                          title: "Total Entries",
                        );
                      } else if (state is ErrorGetAllMoodsState) {
                        return const Center(child: Text("Error"));
                      }
                      return const Text("noo");
                    },
                  ),

                  BlocBuilder<MoodsCubit, MoodsStates>(
                    buildWhen: (_, current) =>
                        (current is MostFrequentMoodLoading ||
                        current is MostFrequentMoodLoaded ||
                        current is MostFrequentMoodError),
                    builder: (context, state) {
                      if (state is MostFrequentMoodLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is MostFrequentMoodLoaded) {
                        return CustomItem(
                          fixedIcon: false,
                          emoji: getEmoji(state.mood?.emoji).$1,
                          bgColor: AppTheme.creamYellow,
                          color: AppTheme.darkBrown,
                          result: getEmoji(state.mood?.emoji).$2,
                          title: "Most Frequent",
                        );
                      } else if (state is MostFrequentMoodError) {
                        return Center(child: const Text("???"));
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocBuilder<MoodsCubit, MoodsStates>(
                    buildWhen: (_, current) =>
                        (current is WritingStreakLoading ||
                        current is WritingStreakLoaded ||
                        current is WritingStreakError),
                    builder: (context, state) {
                      if (state is WritingStreakLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is WritingStreakLoaded) {
                        return CustomItem(
                          icon: "assets/icons/fire.png",
                          bgColor: AppTheme.lightPink,
                          color: AppTheme.deepRose,
                          result: "${state.streak} Days",
                          title: "Writing Streak",
                        );
                      } else if (state is WritingStreakError) {
                        return const Text("Error");
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocBuilder<MoodsCubit, MoodsStates>(
                    buildWhen: (_, current) =>
                        current is MoodTodayLoading ||
                        current is MoodTodayLoaded ||
                        current is MoodTodayError,
                    builder: (contexts, statee) {
                      if (statee is MoodTodayLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (statee is MoodTodayLoaded) {
                        return CustomItem(
                          fixedIcon: false,
                          emoji: getEmoji(statee.mood?.emoji).$1,
                          bgColor: AppTheme.mintGreen,
                          color: AppTheme.forestGreen,
                          result: getEmoji(statee.mood?.emoji).$2,
                          title: "Today's Mood",
                        );
                      } else if (statee is MoodTodayError) {
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
                Navigator.of(
                  context,
                ).pushReplacementNamed(AddMoodScreen.routeName);
              },
              title: "Add Mood",
            ),
          ],
        ),
      ),
    );
  }
}
