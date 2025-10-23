import 'dart:developer';
import 'package:moodly_j/core/data_base/local_data_base.dart';
import 'package:moodly_j/core/failure/app_exception.dart';
import 'package:moodly_j/features/moods/data/data_sources/moods_data_source.dart';
import 'package:moodly_j/features/moods/data/models/mood_model.dart';

class SqlMoodsDataSource implements MoodsDataSource {
  final LocalDatabase localDB;
  SqlMoodsDataSource(this.localDB);
  @override
  Future<void> addMood({required MoodModel moodModel}) async {
    try {
      int id = await localDB.addMood(moodModel: moodModel);
    } catch (e) {
      log(e.toString());

      throw AppException("Failed To Add Your Mood");
    }
  }

  @override
  Future<void> deleteMode({required int modeID}) async {
    try {
      await localDB.deleteMood(id: modeID);
    } catch (e) {
      log(e.toString());
      throw AppException("Failed To Delete This Mood");
    }
  }

  @override
  Future<List<MoodModel>> getAllMoods() async {
    try {
      final allMoods = await localDB.getAllMoods();
      return allMoods;
    } catch (e) {
      log(e.toString());
      throw AppException(e.toString());
    }
  }
}
// user (name, moods, lang , theme, notifications)