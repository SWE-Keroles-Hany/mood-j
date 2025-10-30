import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';

class ChangeImage {
  final UserRepo _userRepo;
  ChangeImage(this._userRepo);
  Future<Either<Failure, void>> changeImage({required String imgPath}) async {
    return await _userRepo.changeImage(imgPath: imgPath);
  }
}
