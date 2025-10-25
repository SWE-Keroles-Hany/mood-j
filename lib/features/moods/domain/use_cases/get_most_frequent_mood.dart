import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

class GetMostFrequentMood {
  final MoodsRepository _moodsRepository;
  GetMostFrequentMood(this._moodsRepository);
  Future<Either<Failure, MoodEntity?>> getMostFrequentMood() async {
    return await _moodsRepository.getMostFrequentMood();
  }
}
