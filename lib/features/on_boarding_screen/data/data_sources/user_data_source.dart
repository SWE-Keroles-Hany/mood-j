import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';

abstract class UserDataSource {
  //! create
  Future<void> createUser({required UserModel userModel});
  //!  update
  Future<void> updateUser({required Map<String, dynamic> fields});
  //! getUser
  Future<UserModel?> getUser();
  //!  isUserCreated
  Future<void> isUserCreated();
}
