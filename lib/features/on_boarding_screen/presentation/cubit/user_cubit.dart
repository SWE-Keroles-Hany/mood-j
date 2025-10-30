import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/change_image.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/change_language.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/change_user_name.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/create_user.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/get_user.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/is_user_created.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_states.dart';

class UserCubit extends Cubit<UserStates> {
  final CreateUser _createUser;
  final IsUserCreated _isUserCreated;
  final GetUser _getUser;
  final ChangeImage _changeImage;
  final ChangeLanguage _changeLanguage;
  final ChangeUserName _changeUserName;
  UserEntity? user;

  UserCubit(
    this._createUser,
    this._isUserCreated,
    this._getUser,
    this._changeImage,
    this._changeLanguage,
    this._changeUserName,
  ) : super(IntailUserState());

  Future<void> createUser({required UserEntity userEntity}) async {
    emit(LoadingCreateUserState());
    final result = await _createUser.createUser(userEntity: userEntity);
    result.fold(
      (failure) {
        emit(ErrorCreateUserState(failure.message));
      },
      (_) {
        emit(SuccessCreateUserState());
      },
    );
  }

  Future<void> getUser() async {
    emit(LoadingGetUserState());
    final result = await _getUser.getUser();
    result.fold(
      (failure) {
        emit(ErrorGetUserState(failure.message));
      },
      (result) {
        print(result!.imgPath);
        user = result;
        emit(SuccessGetUserState(result));
      },
    );
  }

  Future<void> isUserCreated() async {
    emit(LoadingIsUserCreatedState());
    final result = await _isUserCreated.isUserCreated();
    result.fold(
      (failure) {
        emit(ErrorIsUserCreatedState(failure.message));
      },
      (result) {
        emit(SuccessIsUserCreatedStateState());
      },
    );
  }

  Future<void> changeImage({required String imgPath}) async {
    emit(LoadingChangeImageState());
    final result = await _changeImage.changeImage(imgPath: imgPath);
    result.fold(
      (failure) {
        emit(ErrorChangeImageState(failure.message));
      },
      (result) {
        emit(SuccessChangeImageState());
      },
    );
  }

  Future<void> changeUserName({required String name}) async {
    emit(LoadingChangeNameState());
    final result = await _changeUserName.changeUserName(name: name);
    result.fold(
      (failure) {
        emit(ErrorChangeNameState(failure.message));
      },
      (result) {
        emit(SuccessChangeNameState());
      },
    );
  }

  Future<void> changeLanguage({required String language}) async {
    emit(LoadingChangeLanguageState());
    final result = await _changeLanguage.changeLanguage(language: language);
    result.fold(
      (failure) {
        emit(ErrorChangeLanguageState(failure.message));
      },
      (result) {
        emit(SuccessChangeLanguageState());
      },
    );
  }
}
