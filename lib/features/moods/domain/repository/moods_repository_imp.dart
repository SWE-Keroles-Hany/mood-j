import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/data_sources/moods_data_source.dart';
import 'package:moodly_j/features/moods/data/mappers/mood_model_mapper.dart';
import 'package:moodly_j/features/moods/data/models/mood_model.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

class MoodsRepositoryImp implements MoodsRepository {
  final MoodsDataSource _moodsDataSource;
  List<MoodModel> allMoodsModel = [];
  MoodsRepositoryImp(this._moodsDataSource);
  @override
  Future<Either<Failure, void>> addMood({required MoodModel moodModel}) async {
    try {
      await _moodsDataSource.addMood(moodModel: moodModel);
      return Right(null);
    } catch (_) {
      return Left(Failure("Failed To Add Your Mood, try again"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMode({required int moodId}) async {
    try {
      await _moodsDataSource.deleteMode(modeID: moodId);
      return Right(null);
    } catch (_) {
      return Left(Failure("Failed To Delete This Mood, try again"));
    }
  }

  @override
  Future<Either<Failure, List<MoodEntity>>> getAllMoods() async {
    try {
      allMoodsModel = await _moodsDataSource.getAllMoods();

      final List<MoodEntity> allMoods = allMoodsModel
          .map((mood) => mood.toEntity)
          .toList();

      return Right(allMoods);
    } catch (e) {
      log(e.toString());
      return Left(Failure("Error"));
    }
  }

  @override
  Future<Either<Failure, MoodEntity?>> getMostFrequentMood() async {
    try {
      if (allMoodsModel.isEmpty) return Right(null);

      // نحسب عدد تكرار كل إيموجي
      final Map<String, int> moodCounts = {};
      for (final mood in allMoodsModel) {
        final emoji = mood.emoji;
        moodCounts[emoji] = (moodCounts[emoji] ?? 0) + 1;
      }

      // نحدد الإيموجي الأكثر تكرارًا
      final mostFrequentEmoji = moodCounts.entries
          .reduce((a, b) => a.value >= b.value ? a : b)
          .key;

      // نرجّع أول مود عنده نفس الإيموجي ده
      final mostFrequentMood = allMoodsModel.firstWhere(
        (mood) => mood.emoji == mostFrequentEmoji,
        orElse: () => allMoodsModel.first,
      );

      // نرجع الـ Entity
      return Right(mostFrequentMood.toEntity);
    } catch (e, stackTrace) {
      log("Error in getMostFrequentMood: $e\n$stackTrace");
      return Left(Failure("Something went wrong, please try again."));
    }
  }

  @override
  Future<Either<Failure, int>> getWritingStreak() async {
    try {
      if (allMoodsModel.isEmpty) return Right(0);

      // نرتب المودات حسب التاريخ تنازليًا
      allMoodsModel.sort((a, b) => b.moodDate.compareTo(a.moodDate));

      int streak = 1;
      for (int i = 0; i < allMoodsModel.length - 1; i++) {
        final currentDate = allMoodsModel[i].moodDate;
        final nextDate = allMoodsModel[i + 1].moodDate;

        // الفرق بين اليوم الحالي والي بعده
        final difference = currentDate.difference(nextDate).inDays;

        if (difference == 1) {
          streak++;
        } else if (difference > 1) {
          break;
        }
      }

      return Right(streak);
    } catch (e) {
      log(e.toString());

      return Left(Failure("Failed to calculate writing streak"));
    }
  }

  @override
  Future<Either<Failure, MoodEntity?>> getMoodToday() async {
    try {
      if (allMoodsModel.isEmpty) return Right(null);

      final today = DateTime.now();

      MoodModel? moodToday;
      try {
        moodToday = allMoodsModel.firstWhere(
          (m) =>
              m.moodDate.year == today.year &&
              m.moodDate.month == today.month &&
              m.moodDate.day == today.day,
        );
      } catch (_) {
        moodToday = null;
      }

      if (moodToday == null) return Right(null);

      return Right(moodToday.toEntity);
    } catch (e) {
      log(e.toString());
      return Left(Failure("Failed to get today's mood"));
    }
  }
}
