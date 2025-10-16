import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moodly_j/core/our_emojis.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
import 'package:moodly_j/core/ui_uitils.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_states.dart';
import 'package:moodly_j/features/moods/presentation/widgets/custom_mood.dart';
import 'package:moodly_j/features/moods/presentation/widgets/elvated_button.dart';
import 'package:moodly_j/features/moods/presentation/widgets/feature_lable.dart';
import 'package:moodly_j/features/moods/presentation/widgets/feeling_input_field.dart';
import 'package:moodly_j/features/moods/presentation/widgets/pro_item.dart';
import 'package:moodly_j/features/moods/presentation/widgets/voice_recorder.dart';

class AddMoodScreen extends StatefulWidget {
  static const String routeName = "AddMoodScreen";
  const AddMoodScreen({super.key});

  @override
  State<AddMoodScreen> createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends State<AddMoodScreen> {
  TextEditingController descriptionController = TextEditingController();
  String? selectedEmoji;
  XFile? selectedImg;
  File? recorededFile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //
              FeelingInputField(controller: descriptionController),
              SizedBox(height: 10.h),
              FeatureLable(lable: "How's Your Mood"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomMood(
                    backgroundColor: selectedEmoji == OurEmojis.happy.toString()
                        ? AppTheme.blue
                        : null,
                    onPressed: () {
                      setState(() {
                        selectedEmoji = OurEmojis.happy.toString();
                      });
                    },
                    emoji: OurEmojis.happy.toString(),
                  ),
                  CustomMood(
                    backgroundColor:
                        selectedEmoji == OurEmojis.excited.toString()
                        ? AppTheme.blue
                        : null,
                    onPressed: () {
                      setState(() {
                        selectedEmoji = OurEmojis.excited.toString();
                      });
                    },
                    emoji: OurEmojis.excited.toString(),
                  ),
                  CustomMood(
                    backgroundColor:
                        selectedEmoji == OurEmojis.bullying.toString()
                        ? AppTheme.blue
                        : null,
                    onPressed: () {
                      setState(() {
                        selectedEmoji = OurEmojis.bullying.toString();
                      });
                    },
                    emoji: OurEmojis.bullying.toString(),
                  ),
                  CustomMood(
                    backgroundColor: selectedEmoji == OurEmojis.calm.toString()
                        ? AppTheme.blue
                        : null,
                    onPressed: () {
                      setState(() {
                        selectedEmoji = OurEmojis.calm.toString();
                      });
                    },
                    emoji: OurEmojis.calm.toString(),
                  ),
                  CustomMood(
                    backgroundColor: selectedEmoji == OurEmojis.angry.toString()
                        ? AppTheme.blue
                        : null,
                    onPressed: () {
                      setState(() {
                        selectedEmoji = OurEmojis.angry.toString();
                      });
                    },
                    emoji: OurEmojis.angry.toString(),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              FeatureLable(lable: "Attachments"),

              SizedBox(height: 8.h),
              GestureDetector(
                onTap: pickImage,
                child: ProItem(
                  icon: Icons.add_photo_alternate,
                  title: "Add Photo",
                ),
              ),

              SizedBox(height: 12.h),
              Row(
                children: [
                  Spacer(),
                  VoiceRecorder(
                    onRecorded: (file) {
                      recorededFile = file;
                      setState(() {});
                    },
                  ),
                  SizedBox(width: 20.w),
                ],
              ),

              SizedBox(height: 6.h),

              Spacer(),
              BlocListener<MoodsCubit, MoodsStates>(
                listener: (context, state) {
                  if (state is LoadingAddMoodState) {
                    UiUtils.showLoadingIndicator(context);
                  } else if (state is ErrorAddMoodState) {
                    UiUtils.hideLoading(context);
                    UiUtils.showMessage(context, state.message, false);
                  } else if (state is SuccessAddMoodState) {
                    UiUtils.hideLoading(context);
                    UiUtils.showMessage(context, "Your Mood Added", true);
                    Navigator.of(context).pop();
                  }
                },
                child: ElvatedButton(onPressed: addMood, title: "Save"),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        appBar: AppBar(title: Text("Add Mood")),
      ),
    );
  }

  Future<void> addMood() async {
    if (descriptionController.text.trim().isEmpty || selectedEmoji == null) {
      UiUtils.showMessage(context, "Description And Emoji are Requried", false);
    } else {
      final moodEntity = MoodEntity(
        descriptionController.text,
        selectedEmoji!,
        recorededFile.toString(),
        selectedImg.toString(),
      );
      await BlocProvider.of<MoodsCubit>(
        context,
      ).addMood(moodEntity: moodEntity);
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    selectedImg = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
