import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/core/ui/ui_uitils.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_states.dart';
import 'package:moodly_j/features/moods/presentation/widgets/journal_item.dart';

class JournalistTab extends StatefulWidget {
  const JournalistTab({super.key});

  @override
  State<JournalistTab> createState() => _JournalistTabState();
}

class _JournalistTabState extends State<JournalistTab> {
  late final MoodsCubit moodsCubit;

  @override
  void initState() {
    super.initState();
    moodsCubit = context.read<MoodsCubit>();
    moodsCubit.getAllMoods();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Title
          Text(
            "Your Journal Moods",
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(
              color: AppTheme.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          ),
          SizedBox(height: 14.h),

          /// Bloc Listener + Builder (مع بعض)
          Expanded(
            child: BlocListener<MoodsCubit, MoodsStates>(
              listener: (context, state) {
                if (state is LoadingDeleteMoodState) {
                  UiUtils.showLoadingIndicator(context);
                } else if (state is ErrorDeleteMoodState) {
                  UiUtils.hideLoading(context);
                  UiUtils.showMessage(context, state.message, false);
                } else if (state is SuccessDeleteMoodState) {
                  UiUtils.hideLoading(context);
                  moodsCubit.getAllMoods();
                }
              },
              child: BlocBuilder<MoodsCubit, MoodsStates>(
                builder: (context, state) {
                  /// حالة التحميل عند جلب كل الـ moods
                  if (state is LoadingGetAllMoodsState) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppTheme.amber),
                    );
                  }

                  /// حالة الخطأ عند الجلب
                  if (state is ErrorGetAllMoodsState) {
                    return Center(
                      child: Text(
                        state.message,
                        style: textTheme.titleMedium?.copyWith(
                          color: AppTheme.deepRose,
                        ),
                      ),
                    );
                  }

                  /// حالة النجاح
                  if (state is SuccessGetAllMoodsState) {
                    final moods = state.allMoods;

                    /// لو فاضي
                    if (moods.isEmpty) {
                      return Center(
                        child: Text(
                          "You don't have any journal moods.",
                          style: textTheme.titleMedium?.copyWith(
                            color: AppTheme.deepRose,
                          ),
                        ),
                      );
                    }

                    /// عرض الليست
                    return ListView.separated(
                      itemCount: moods.length,
                      separatorBuilder: (_, _) => SizedBox(height: 14.h),
                      itemBuilder: (context, index) {
                        final mood = moods[index];
                        return JournalItem(
                          mood: mood,
                          onDelete: () async {
                            await moodsCubit.deleteMode(moodId: mood.id ?? 0);
                          },
                        );
                      },
                    );
                  }

                  /// الحالة الافتراضية
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
