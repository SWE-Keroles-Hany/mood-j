import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/enitities/user_entity.dart';

extension UserEntityMapper on UserEntity {
  UserModel get toModel =>
      UserModel(name: name, language: language, imgPath: imgPath);
}
