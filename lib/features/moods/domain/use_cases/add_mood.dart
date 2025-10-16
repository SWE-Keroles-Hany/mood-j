import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/mappers/mood_entity_mapper.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

class AddMood {
  final MoodsRepository _moodsRepository;
  AddMood(this._moodsRepository);
  Future<Either<Failure, void>> addMood({
    required MoodEntity moodEntity,
  }) async {
    return _moodsRepository.addMood(moodModel: moodEntity.toModel);
  }
}
