import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';

class ChangeLanguage {
  final UserRepo _userRepo;
  ChangeLanguage(this._userRepo);
  Future<Either<Failure, void>> changeLanguage({
    required String language,
  }) async {
    return await _userRepo.changeLanguage(language: language);
  }
}
