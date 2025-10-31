import 'dart:developer';

import 'package:moodly_j/core/data_base/local_data_base.dart';
import 'package:moodly_j/core/failure/app_exception.dart';
import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
import 'package:moodly_j/features/on_boarding_screen/data/data_sources/user_data_source.dart';

class SqlUserDataSource implements UserDataSource {
  final LocalDatabase localDatabase;
  SqlUserDataSource(this.localDatabase);
  @override
  Future<void> createUser({required UserModel userModel}) async {
    try {
      userModel.toMap();
      await localDatabase.createUser(userModel: userModel);
      print(" in create =>  ${userModel.imgPath}");
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong, try again");
    }
  }

  @override
  Future<void> changeUserName({required String name}) async {
    try {
      await localDatabase.updateUser({'name': name});
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong, try again");
    }
  }

  @override
  Future<void> changeImage({required String imgPath}) async {
    try {
      await localDatabase.updateUser({'imgPath': imgPath});
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong, try again");
    }
  }

  @override
  Future<void> changeLanguage({required String language}) async {
    try {
      await localDatabase.updateUser({'language': language});
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong, try again");
    }
  }

  @override
  Future<UserModel?> getUser() async {
    //! all user moods --> lenght , most freq
    //!
    try {
      final user = await localDatabase.getUser();
      return user;
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong, try again");
    }
  }

  @override
  Future<void> isUserCreated() async {
    try {
      final user = await getUser();
      if (user == null) {
        throw AppException("Some Thing Went Wrong, try again");
      }
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong, try again");
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await localDatabase.clearAllData();
    } catch (error) {
      throw AppException("Some Thing Went Wrong, try again");
    }
  }

  @override
  Future<void> enableNotification({required bool enableNotification}) async {
    try {
      await localDatabase.updateUser({
        "enableNotification": enableNotification,
      });
    } catch (error) {
      throw AppException("Some Thing Went Wrong, try again");
    }
  }
}
