import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

class GetMoodToday {
  final MoodsRepository _moodsRepository;
  GetMoodToday(this._moodsRepository);
  Future<Either<Failure, MoodEntity?>> getMoodToday() async {
    return await _moodsRepository.getMoodToday();
  }
}
