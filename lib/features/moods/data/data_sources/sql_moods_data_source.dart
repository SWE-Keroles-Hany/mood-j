import 'package:moodly_j/features/moods/data/data_sources/moods_data_source.dart';
import 'package:moodly_j/features/moods/data/models/mood_model.dart';

class SqlMoodsDataSource implements MoodsDataSource {
  @override
  Future<void> addMood({required MoodModel moodModel}) {
    // TODO: implement addMood
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMode({required String modeID}) {
    // TODO: implement deleteMode
    throw UnimplementedError();
  }

  @override
  Future<List<MoodModel>> getAllMoods() {
    // TODO: implement getAllMoods
    throw UnimplementedError();
  }

  @override
  Future<void> updateMood({
    required String modeID,
    required MoodModel moodModel,
  }) {
    // TODO: implement updateMood
    throw UnimplementedError();
  }
}
