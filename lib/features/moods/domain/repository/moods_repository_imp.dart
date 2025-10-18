import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/data_sources/moods_data_source.dart';
import 'package:moodly_j/features/moods/data/mappers/mood_model_mapper.dart';
import 'package:moodly_j/features/moods/data/models/mood_model.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

class MoodsRepositoryImp implements MoodsRepository {
  final MoodsDataSource _moodsDataSource;
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
      final List<MoodModel> allMoodsModel = await _moodsDataSource
          .getAllMoods();

      final List<MoodEntity> allMoods = allMoodsModel
          .map((mood) => mood.toEntity)
          .toList();
      print("Audio from repo ${allMoods[1].audioPath}");
      print("imgPath from repo ${allMoods[1].imgPath}");
      return Right(allMoods);
    } catch (_) {
      return Left(Failure("Failed Get Your Moods"));
    }
  }
}
