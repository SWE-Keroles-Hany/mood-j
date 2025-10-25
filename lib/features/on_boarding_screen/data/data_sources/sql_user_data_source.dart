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
      await localDatabase.createUser(userModel: userModel);
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong, try again");
    }
  }

  @override
  Future<void> updateUser({required Map<String, dynamic> fields}) async {
    try {
      await localDatabase.updateUser({
        'theme': fields['theme'],
        'name': fields['name'],
        'language': fields['language'],
        'notificationTime': fields['notificationTime'],
      });
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
}
