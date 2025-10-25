import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/features/moods/presentation/widgets/elvated_button.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_cubit.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_states.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/widgets/start_bottom_sheet.dart';
import 'package:moodly_j/features/settings/widgets/notification_setting.dart';
import 'package:moodly_j/features/settings/widgets/settign_item_lable.dart';
import 'package:moodly_j/features/settings/widgets/setting_item.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final themeController = ValueNotifier<bool>(true);
  final notificationController = ValueNotifier<bool>(true);
  final lanaugeController = ValueNotifier<bool>(true);
  final nameController = TextEditingController();

  //! Theme Variables
  bool lightSelected = true;
  String theme = "Light";
  //! Reminder Variables
  bool reminderSelected = false;
  String reminder = "Off";
  //! Reminder Variables
  bool languageSelected = false;
  String language = "English";
  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(22.r),
      child: BlocBuilder<UserCubit, UserStates>(
        builder: (context, state) {
          if (state is SuccessGetUserState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final imgUrl = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    await userCubit.updateUser(
                      fields: {'imgUrl': imgUrl!.path},
                    );
                  },
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 3.w,
                        style: BorderStyle.solid,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/icons/person.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  textAlign: TextAlign.center,
                  state.user.name,
                  style: textTheme.titleMedium!.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                ),
                SizedBox(height: 20.h),
                SettingItem(
                  controller: lanaugeController,
                  onChanged: onLanguageChange,
                  subTitle: language,
                  title: "Language",
                ),
                SizedBox(height: 5.h),
                Divider(color: AppTheme.blue, indent: 50.w, endIndent: 50.w),
                SizedBox(height: 5.h),
                NotificationSetting(
                  reminderMe: reminderSelected,
                  controller: notificationController,
                  onChanged: dailyReminder,
                  subTitle: "Notification",
                  title: "Daily Reminder",
                ),
              ],
            );
          } else if (state is ErrorGetUserState) {
            return Center(child: Text("Some Thing Went Wrong"));
          } else if (state is LoadingGetUserState) {
            return Center(child: CircularProgressIndicator());
          }
          return SizedBox();
        },
      ),
    );
  }

  void onThemeChange(dynamic value) {
    setState(() {
      lightSelected = !lightSelected;
      if (lightSelected) {
        theme = "Light";
      } else {
        theme = "Dark";
      }
    });
  }

  void onLanguageChange(dynamic value) async {
    setState(() {
      languageSelected = !languageSelected;
      if (languageSelected) {
        language = "English";
      } else {
        language = "Arabic";
      }
    });
  }

  void dailyReminder(dynamic value) {
    setState(() {
      reminderSelected = !reminderSelected;
      if (reminderSelected) {
        reminder = "Off";
      } else {
        reminder = "On";
      }
    });
  }
}
