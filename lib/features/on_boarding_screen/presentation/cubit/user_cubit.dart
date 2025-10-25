import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/create_user.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/get_user.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/is_user_created.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/update_user.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_states.dart';

class UserCubit extends Cubit<UserStates> {
  final CreateUser _createUser;
  final UpdateUser _updateUser;
  final IsUserCreated _isUserCreated;
  final GetUser _getUser;

  UserCubit(
    this._createUser,
    this._isUserCreated,
    this._updateUser,
    this._getUser,
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

  Future<void> updateUser({required Map<String, dynamic> fields}) async {
    emit(LoadingUpdateUserState());
    final result = await _updateUser.updateUser(fields: fields);
    result.fold(
      (failure) {
        emit(ErrorUpdateUserState(failure.message));
      },
      (_) {
        emit(SuccessUpdateUserState());
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
        emit(SuccessGetUserState(result!));
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
}
