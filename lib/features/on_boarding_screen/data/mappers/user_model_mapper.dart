import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

extension UserModelMapper on UserModel {
  UserEntity get toEntity => UserEntity(
    name: name,
    language: language,
    notificationTime: notificationTime,
    theme: theme,
  );
}
