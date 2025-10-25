class UserEntity {
  String name;
  DateTime? notificationTime;
  String? language;
  String? theme;

  UserEntity({
    required this.name,
    this.language = 'en',
    this.notificationTime,
    this.theme = 'light',
  });
}
