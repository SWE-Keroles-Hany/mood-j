class UserEntity {
  String name;
  String language;
  String imgPath;
  int enableNotification;

  UserEntity({
    required this.enableNotification,
    required this.name,
    required this.language,
    required this.imgPath,
  });
}
