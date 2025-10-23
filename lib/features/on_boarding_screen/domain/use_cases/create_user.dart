import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/mappers/user_entity_mapper.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

class CreateUser {
  final UserRepo _userRepo;
  CreateUser(this._userRepo);
  Future<Either<Failure, void>> createUser({
    required UserEntity userEntity,
  }) async {
    return await _userRepo.createUser(userModel: userEntity.toModel);
  }
}
