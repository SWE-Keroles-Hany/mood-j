import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/models/mood_model.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

abstract class MoodsRepository {
  Future<Either<Failure, void>> addMood({required MoodModel moodModel});
  Future<Either<Failure, void>> deleteMode({required int moodId});
  Future<Either<Failure, List<MoodEntity>>> getAllMoods();
}
