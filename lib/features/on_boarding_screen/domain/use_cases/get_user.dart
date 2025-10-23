import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

class GetUser {
  final UserRepo _userRepo;
  GetUser(this._userRepo);
  Future<Either<Failure, UserEntity?>> getUser() async {
    return await _userRepo.getUser();
  }
}
