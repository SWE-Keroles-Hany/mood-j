import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';

class DeleteMood {
  final MoodsRepository _moodsRepository;
  DeleteMood(this._moodsRepository);
  Future<Either<Failure, void>> deleteMode({required int moodId}) async {
    return _moodsRepository.deleteMode(moodId: moodId);
  }
}
