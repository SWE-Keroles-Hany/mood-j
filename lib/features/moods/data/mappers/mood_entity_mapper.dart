import 'package:moodly_j/features/moods/data/models/mood_model.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

extension MoodEntityMapper on MoodEntity {
  MoodModel get toModel => MoodModel(
    description: description,
    emoji: emoji,
    audioPath: audioPath,
    imgPath: imgPath,
    moodDate: moodDate,
    id: id,
  );
}
