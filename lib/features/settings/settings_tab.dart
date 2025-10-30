import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moodly_j/core/service_locator/get_it.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/core/ui/ui_uitils.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_cubit.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_states.dart';
import 'package:moodly_j/features/settings/widgets/notification_setting.dart';
import 'package:moodly_j/l10n/app_localizations.dart';

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

  bool reminderSelected = false;
  String reminder = "Off";
  String language = 'en';

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final userCubit = BlocProvider.of<UserCubit>(context);
    final textTheme = Theme.of(context).textTheme;
    language = userCubit.user!.language;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: BlocListener<UserCubit, UserStates>(
          listener: (context, state) {
            if (state is SuccessChangeImageState ||
                state is SuccessChangeLanguageState) {
              UiUtils.hideLoading(context);
              userCubit.getUser();
            } else if (state is ErrorChangeImageState ||
                state is ErrorChangeLanguageState) {
              UiUtils.hideLoading(context);
              UiUtils.showMessage(
                context,
                localization.someThingWentWrong,
                false,
              );
            } else if (state is LoadingChangeImageState ||
                state is LoadingChangeLanguageState) {
              UiUtils.showLoadingIndicator(context);
            }
          },
          child: BlocBuilder<UserCubit, UserStates>(
            builder: (context, state) {
              if (state is LoadingGetUserState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorGetUserState) {
                return Center(child: Text(localization.someThingWentWrong));
              } else if (state is SuccessGetUserState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// ---------- Profile Section ----------
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final imgUrl = await picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (imgUrl == null) return;
                            await userCubit.changeImage(imgPath: imgUrl.path);
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 70.r,
                                // backgroundColor: AppTheme.blue,
                                backgroundImage: FileImage(
                                  File(userCubit.user!.imgPath),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.blue,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        state.user!.name,
                        style: textTheme.titleMedium!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 25.h),

                      /// ---------- Notification ----------
                      NotificationSetting(
                        reminderMe: reminderSelected,
                        controller: notificationController,
                        onChanged: dailyReminder,
                        subTitle: "Notification",
                        title: localization.dailyReminder,
                      ),
                      SizedBox(height: 20.h),

                      /// ---------- Language ----------
                      _buildCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              localization.language,
                              style: textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: AppTheme.black,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppTheme.blue),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: language,
                                  icon: Icon(
                                    Icons.language,
                                    color: AppTheme.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                  style: TextStyle(
                                    color: AppTheme.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  dropdownColor: Colors.white,
                                  onChanged: (value) async {
                                    await BlocProvider.of<UserCubit>(
                                      context,
                                    ).changeLanguage(language: value!);
                                    setState(() {
                                      language = value;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      value: 'en',
                                      child: Text(localization.english),
                                    ),
                                    DropdownMenuItem(
                                      value: 'ar',
                                      child: Text(localization.arabic),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),

                      /// ---------- Logout Button ----------
                      _buildCard(
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.redAccent,
                                size: 24.sp,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                localization.logOut,
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 14.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  void dailyReminder(dynamic value) {
    setState(() {
      reminderSelected = !reminderSelected;
      reminder = reminderSelected ? "Off" : "On";
    });
  }
}
