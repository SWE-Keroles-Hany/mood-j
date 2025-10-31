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

//! Change Img States
class LoadingChangeImageState implements UserStates {}

class ErrorChangeImageState implements UserStates {
  final String message;
  ErrorChangeImageState(this.message);
}

class SuccessChangeImageState implements UserStates {}

//! Change Lang States
class LoadingChangeLanguageState implements UserStates {}

class ErrorChangeLanguageState implements UserStates {
  final String message;
  ErrorChangeLanguageState(this.message);
}

class SuccessChangeLanguageState implements UserStates {}

//! Change Name States
class LoadingChangeNameState implements UserStates {}

class ErrorChangeNameState implements UserStates {
  final String message;
  ErrorChangeNameState(this.message);
}

class SuccessChangeNameState implements UserStates {}

//! Get User State
class LoadingGetUserState implements UserStates {}

class ErrorGetUserState implements UserStates {
  final String message;
  ErrorGetUserState(this.message);
}

class SuccessGetUserState implements UserStates {
  final UserEntity? user;
  SuccessGetUserState(this.user);
}

//! Is User Created State
class LoadingIsUserCreatedState implements UserStates {}

class ErrorIsUserCreatedState implements UserStates {
  final String message;
  ErrorIsUserCreatedState(this.message);
}

class SuccessIsUserCreatedStateState implements UserStates {}

//! Log-out State
class LoadingLogOutState implements UserStates {}

class ErrorLogOutState implements UserStates {
  final String message;
  ErrorLogOutState(this.message);
}

class SuccessLogOutState implements UserStates {}

//! Enable Notificatoin State
class LoadingEnableNotificatoinState implements UserStates {}

class ErrorEnableNotificatoinState implements UserStates {
  final String message;
  ErrorEnableNotificatoinState(this.message);
}

class SuccessEnableNotificatoinState implements UserStates {}
