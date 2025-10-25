class UserModel {
  String name;
  DateTime? notificationTime;
  String? language;
  String? theme;

  UserModel({
    required this.name,
    this.language = "en",
    this.notificationTime,
    this.theme = "light",
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'notificationTime': notificationTime?.toIso8601String(),
      'language': language,
      'theme': theme,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      notificationTime: map['notificationTime'] != null
          ? DateTime.parse(map['notificationTime'])
          : null,
      language: map['language'],
      theme: map['theme'],
    );
  }
}
