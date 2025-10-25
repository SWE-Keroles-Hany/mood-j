class UserEntity {
  String name;
  DateTime? notificationTime;
  String? language;
  String? theme;
  String? imgUrl;

  UserEntity({
    required this.name,
    this.language = 'en',
    this.notificationTime,
    this.theme = 'light',
    this.imgUrl,
  });
}
