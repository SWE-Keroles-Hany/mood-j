import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moodly_j/core/our_emojis.dart';
import 'package:moodly_j/core/theme/app_theme.dart';
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
  TextEditingController controller = TextEditingController();
  String? selectedEmoji;
  XFile? selectedImg;
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
              FeelingInputField(controller: controller),
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
                  VoiceRecorder(),
                  SizedBox(width: 20.w),
                ],
              ),

              SizedBox(height: 6.h),

              Spacer(),
              ElvatedButton(
                controller: controller,
                onPressed: addMood,
                title: "Save",
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        appBar: AppBar(title: Text("Add Mood")),
      ),
    );
  }

  void addMood() {
    if (controller.text.trim().isEmpty) {
    } else if (selectedEmoji == null) {
    } else {}
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    selectedImg = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
