import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';

class UpdateUser {
  final UserRepo _userRepo;
  UpdateUser(this._userRepo);
  Future<Either<Failure, void>> updateUser({
    required Map<String, dynamic> fields,
  }) async {
    return await _userRepo.updateUser(fields: fields);
  }
}
