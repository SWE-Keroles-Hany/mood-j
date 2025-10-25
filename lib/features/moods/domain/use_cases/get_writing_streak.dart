import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';

class GetWritingStreak {
  final MoodsRepository _moodsRepository;
  GetWritingStreak(this._moodsRepository);
  Future<Either<Failure, int>> getWritingStreak() async {
    return await _moodsRepository.getWritingStreak();
  }
}
