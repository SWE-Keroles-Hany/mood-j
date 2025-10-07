import 'dart:io';

import 'package:flutter/material.dart';
import 'package:voice_note_kit/voice_note_kit.dart';

class VoiceRecorder extends StatefulWidget {
  const VoiceRecorder({super.key});

  @override
  State<VoiceRecorder> createState() => _VoiceRecorderState();
}

class _VoiceRecorderState extends State<VoiceRecorder> {
  File? recordedFile;
  @override
  Widget build(BuildContext context) {
    return VoiceRecorderWidget(
      // iconSize: 60.r,
      showTimerText: true,
      showSwipeLeftToCancel: true,
      onRecorded: (file) {
        setState(() {
          recordedFile = file;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Recording saved: ${file.path}')),
        );
      },

      onError: (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $error')));
      },

      actionWhenCancel: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Recording Cancelled')));
      },

      maxRecordDuration: const Duration(seconds: 60),
      permissionNotGrantedMessage: 'Microphone permission required',
      dragToLeftText: 'Swipe left to cancel recording',
      dragToLeftTextStyle: const TextStyle(
        color: Colors.blueAccent,
        fontSize: 18,
      ),
      cancelDoneText: 'Recording cancelled',
      backgroundColor: Colors.blueAccent,
      cancelHintColor: Colors.red,
      iconColor: Colors.white,
      timerFontSize: 18,
    );
  }
}
