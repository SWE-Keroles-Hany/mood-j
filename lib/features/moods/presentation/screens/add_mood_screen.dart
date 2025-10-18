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
import 'package:moodly_j/features/moods/presentation/widgets/custom_audio_player.dart';
import 'package:moodly_j/features/moods/presentation/widgets/custom_mood.dart';
import 'package:moodly_j/features/moods/presentation/widgets/elvated_button.dart';
import 'package:moodly_j/features/moods/presentation/widgets/feature_lable.dart';
import 'package:moodly_j/features/moods/presentation/widgets/feeling_input_field.dart';
import 'package:moodly_j/features/moods/presentation/widgets/pro_item.dart';
import 'package:moodly_j/features/moods/presentation/widgets/voice_recorder.dart';
import 'package:voice_note_kit/player/audio_player_widget.dart';
import 'package:voice_note_kit/player/player_enums/player_enums.dart';

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
  bool emojiSelected = false;
  List<String> emojis = [
    OurEmojis.angry.toString(),
    OurEmojis.happy.toString(),
    OurEmojis.calm.toString(),
    OurEmojis.excited.toString(),
    OurEmojis.bullying.toString(),
  ];

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
              //! Input Field
              FeelingInputField(controller: descriptionController),
              SizedBox(height: 10.h),
              FeatureLable(lable: "How's Your Mood"),
              //! Emojiis
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  itemExtent: 65.r,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CustomMood(
                    backgroundColor: selectedEmoji == emojis[index]
                        ? AppTheme.blue
                        : null,
                    onPressed: () {
                      selectedEmoji = emojis[index];
                      setState(() {});
                    },
                    emoji: emojis[index],
                  ),
                  itemCount: emojis.length,
                ),
              ),
              SizedBox(height: 14.h),
              FeatureLable(lable: "Attachments"),
              SizedBox(height: 8.h),
              //! Add Photo
              GestureDetector(
                onTap: pickImage,
                child: ProItem(
                  done: selectedImg != null,
                  icon: Icons.add_photo_alternate,
                  title: "Add Photo",
                ),
              ),

              SizedBox(height: 12.h),
              GestureDetector(
                onTap: recordVoice,
                child: ProItem(
                  done: recorededFile != null,
                  icon: Icons.mic,
                  title: "Record Voice",
                ),
              ),
              recorededFile != null
                  ? Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            showRecordedVoice(context);
                          },
                          child: Text(
                            "Listen Your Records",
                            style: textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: AppTheme.forestGreen,
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
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
        appBar: AppBar(
          title: Text(
            "Add Mood",
            style: textTheme.titleLarge!.copyWith(fontSize: 26.sp),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showRecordedVoice(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAudioPlayer(recorededFile: File(recorededFile!.path)),
            ],
          ),
        );
      },
    );
  }

  Future<void> addMood() async {
    if (descriptionController.text.trim().isEmpty || selectedEmoji == null) {
      UiUtils.showMessage(context, "Description And Emoji are Requried", false);
    } else {
      print("From Ui screen : ${recorededFile?.path}");
      print("From Ui screen : ${selectedImg?.path}");

      final moodEntity = MoodEntity(
        description: descriptionController.text,
        emoji: selectedEmoji ?? "",
        audioPath: recorededFile?.path ?? "",
        imgPath: selectedImg?.path ?? "",
        moodDate: DateTime.now(),
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

  Future<void> recordVoice() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Spacer(),
              Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VoiceRecorder(
                      onRecorded: (file) async {
                        recorededFile = file;
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),

              // ElvatedButton(title: "Save", onPressed: () {}),
            ],
          ),
        );
      },
    );
    setState(() {});
  }
}
