import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

class GetAllMoods {
  final MoodsRepository _moodsRepository;
  GetAllMoods(this._moodsRepository);
  Future<Either<Failure, List<MoodEntity>>> getAllMoods() async {
    return _moodsRepository.getAllMoods();
  }
}
