import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

abstract class UserRepo {
  //! create user
  Future<Either<Failure, void>> createUser({required UserModel userModel});

  Future<Either<Failure, UserEntity?>> getUser();
  //! is User Created ..?
  Future<Either<Failure, void>> isUserCreated();
  Future<Either<Failure, void>> changeUserName({required String name});
  Future<Either<Failure, void>> changeLanguage({required String language});

  Future<Either<Failure, void>> changeImage({required String imgPath});
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, void>> enbaleNotification({
    required bool enbleNotification,
  });
}
