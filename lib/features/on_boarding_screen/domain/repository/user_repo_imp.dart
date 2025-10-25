import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/moods/data/data_sources/moods_data_source.dart';
import 'package:moodly_j/features/on_boarding_screen/data/data_sources/user_data_source.dart';
import 'package:moodly_j/features/on_boarding_screen/data/mappers/user_model_mapper.dart';
import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

class UserRepoImp implements UserRepo {
  final UserDataSource _userDataSource;
  final MoodsDataSource _moodsDataSource;

  UserRepoImp(this._userDataSource, this._moodsDataSource);
  @override
  Future<Either<Failure, void>> createUser({
    required UserModel userModel,
  }) async {
    try {
      await _userDataSource.createUser(userModel: userModel);
      return Right(null);
    } catch (_) {
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final user = await _userDataSource.getUser();
      return Right(user!.toEntity);
    } catch (e) {
      log(e.toString());
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }

  @override
  Future<Either<Failure, void>> isUserCreated() async {
    try {
      await _userDataSource.isUserCreated();
      return Right(null);
    } catch (_) {
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser({
    required Map<String, dynamic> fields,
  }) async {
    try {
      await _userDataSource.updateUser(fields: fields);
      return Right(null);
    } catch (_) {
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }
}
