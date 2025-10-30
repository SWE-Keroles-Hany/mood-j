import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';

class ChangeUserName {
  final UserRepo _userRepo;
  ChangeUserName(this._userRepo);
  Future<Either<Failure, void>> changeUserName({required String name}) async {
    return await _userRepo.changeUserName(name: name);
  }
}
