import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';

class IsUserCreated {
  final UserRepo _userRepo;
  IsUserCreated(this._userRepo);
  Future<Either<Failure, void>> isUserCreated() async {
    return await _userRepo.isUserCreated();
  }
}
