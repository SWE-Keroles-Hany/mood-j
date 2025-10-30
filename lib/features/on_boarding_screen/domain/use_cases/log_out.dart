import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';

class LogOut {
  final UserRepo _userRepo;
  LogOut(this._userRepo);
  Future<Either<Failure, void>> logOut() async {
    return await _userRepo.logOut();
  }
}
