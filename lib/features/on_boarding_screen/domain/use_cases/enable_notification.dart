import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';

class EnableNotification {
  final UserRepo _userRepo;
  EnableNotification(this._userRepo);
  Future<Either<Failure, void>> enbaleNotification({
    required bool enbleNotification,
  }) async {
    return await _userRepo.enbaleNotification(
      enbleNotification: enbleNotification,
    );
  }
}
