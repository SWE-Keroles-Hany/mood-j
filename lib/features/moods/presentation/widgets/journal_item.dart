import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_states.dart';
import 'package:moodly_j/features/moods/presentation/screens/journal_details.dart';

// ignore: must_be_immutable
class JournalItem extends StatelessWidget {
  JournalItem({
    required this.index,
    super.key,
    required this.mood,
    required this.onDelete,
  });
  final MoodEntity mood;
  final int index;
  final Function()? onDelete;
  DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<MoodsCubit, MoodsStates>(
      listener: (context, state) {},
      child: GestureDetector(
        onTap: () async {
          Navigator.of(
            context,
          ).pushNamed(JournalDetailsScreen.routeName, arguments: mood);
        },
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26, // shadow color
                blurRadius: 8.r, // softness of the shadow
                offset: Offset(0.w, 4.h), // position: (x, y)
              ),
            ],
            color: AppTheme.lightLavender,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(mood.emoji, style: TextStyle(fontSize: 40.sp)),
              ),
              SizedBox(width: 22.w),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateFormat.format(mood.moodDate),
                      style: textTheme.titleMedium!.copyWith(
                        fontSize: 18.sp,
                        color: AppTheme.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    SizedBox(
                      width: 240.w,
                      child: Text(
                        maxLines: 3,
                        style: textTheme.titleSmall!.copyWith(
                          color: const Color.fromARGB(255, 65, 78, 97),
                        ),
                        overflow: TextOverflow.ellipsis,
                        mood.description,
                      ),
                    ),
                  ],
                ),
              ),
              //! ========>>
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete, size: 30.r),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
