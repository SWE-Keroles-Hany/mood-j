import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:moodly_j/core/failure/failure.dart';
import 'package:moodly_j/features/on_boarding_screen/data/data_sources/user_data_source.dart';
import 'package:moodly_j/features/on_boarding_screen/data/mappers/user_model_mapper.dart';
import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

class UserRepoImp implements UserRepo {
  final UserDataSource _userDataSource;

  UserRepoImp(this._userDataSource);
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
  Future<Either<Failure, UserEntity?>> getUser() async {
    try {
      final user = await _userDataSource.getUser();
      return Right(user?.toEntity);
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
    } catch (error) {
      log(error.toString());
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }

  @override
  Future<Either<Failure, void>> changeUserName({required String name}) async {
    try {
      await _userDataSource.changeUserName(name: name);
      return Right(null);
    } catch (_) {
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }

  @override
  Future<Either<Failure, void>> changeLanguage({
    required String language,
  }) async {
    try {
      await _userDataSource.changeLanguage(language: language);
      return Right(null);
    } catch (_) {
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }

  @override
  Future<Either<Failure, void>> changeImage({required String imgPath}) async {
    try {
      await _userDataSource.changeImage(imgPath: imgPath);
      return Right(null);
    } catch (_) {
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await _userDataSource.logOut();
      return Right(null);
    } catch (_) {
      return Left(Failure("Some Thing Went Wrong, try again!"));
    }
  }
}
