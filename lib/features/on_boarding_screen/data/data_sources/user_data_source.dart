import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';

abstract class UserDataSource {
  //! create
  Future<void> createUser({required UserModel userModel});
  //!  update
  Future<void> changeUserName({required String name});
  Future<void> changeImage({required String imgPath});
  Future<void> changeLanguage({required String language});
  //! getUser
  Future<UserModel?> getUser();
  //!  isUserCreated
  Future<void> isUserCreated();
  Future<void> logOut();
}
