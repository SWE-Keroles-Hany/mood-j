import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

abstract class UserStates {}

class IntailUserState implements UserStates {}

//! Create User State
class LoadingCreateUserState implements UserStates {}

class ErrorCreateUserState implements UserStates {
  final String message;
  ErrorCreateUserState(this.message);
}

class SuccessCreateUserState implements UserStates {}

//! Update User State
class LoadingUpdateUserState implements UserStates {}

class ErrorUpdateUserState implements UserStates {
  final String message;
  ErrorUpdateUserState(this.message);
}

class SuccessUpdateUserState implements UserStates {}

//! Get User State
class LoadingGetUserState implements UserStates {}

class ErrorGetUserState implements UserStates {
  final String message;
  ErrorGetUserState(this.message);
}

class SuccessGetUserState implements UserStates {
  final UserEntity user;
  SuccessGetUserState(this.user);
}

//! Is User Created State
class LoadingIsUserCreatedState implements UserStates {}

class ErrorIsUserCreatedState implements UserStates {
  final String message;
  ErrorIsUserCreatedState(this.message);
}

class SuccessIsUserCreatedStateState implements UserStates {}
