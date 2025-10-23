import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

abstract class UserRepo {
  //! create user
  Future<Either<Failure, void>> createUser({required UserModel userModel});
  //! update user
  Future<Either<Failure, void>> updateUser({
    required Map<String, dynamic> fields,
  });
  //! get User
  Future<Either<Failure, UserEntity?>> getUser();
  //! is User Created ..?
  Future<Either<Failure, void>> isUserCreated();
}
