import 'package:moodly_j/features/moods/data/models/mood_model.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

extension MoodModelMapper on MoodModel {
  MoodEntity get toEntity => MoodEntity(
    description: description,
    emoji: emoji,
    moodDate: moodDate,

    audioPath: audioPath,
    imgPath: imgPath,
  );
}
