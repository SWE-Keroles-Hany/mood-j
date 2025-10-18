// add mood
// delete mood
// get all moods

import 'package:moodly_j/features/moods/data/models/mood_model.dart';

abstract class MoodsDataSource {
  //! Add Mood
  Future<void> addMood({required MoodModel moodModel});

  //! Delete Mood
  Future<void> deleteMode({required int modeID});
  //! get all Moods
  Future<List<MoodModel>> getAllMoods();
}
