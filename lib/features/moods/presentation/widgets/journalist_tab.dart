import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_states.dart';
import 'package:moodly_j/features/moods/presentation/widgets/journal_item.dart';

class JournalistTab extends StatefulWidget {
  const JournalistTab({super.key});

  @override
  State<JournalistTab> createState() => _JournalistTabState();
}

class _JournalistTabState extends State<JournalistTab> {
  @override
  void initState() {
    context.read<MoodsCubit>().getAllMoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contextB = BlocProvider.of<MoodsCubit>(context);
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
          BlocBuilder<MoodsCubit, MoodsStates>(
            builder: (context, state) {
              if (state is LoadingGetAllMoodsState) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: AppTheme.amber),
                  ),
                );
              } else if (state is ErrorGetAllMoodsState) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "Some Thing Went Wrong",
                      style: textTheme.titleMedium!.copyWith(
                        color: AppTheme.deepRose,
                      ),
                    ),
                  ),
                );
              } else if (state is SuccessGetAllMoodsState &&
                  state.allMoods.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "You don't have Journalist",
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.deepRose,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is SuccessGetAllMoodsState) {
                final allMoods = state.allMoods;
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 14.h),
                    itemCount: allMoods.length,
                    itemBuilder: (context, index) {
                      return JournalItem(
                        index: index,
                        onDelete: () async {
                          await contextB.deleteMode(moodId: index + 1);
                        },
                        mood: allMoods[index],
                      );
                    },
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
