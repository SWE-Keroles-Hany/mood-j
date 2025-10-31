class UserModel {
  String name;
  String language;
  String imgPath;
  int enableNotification;

  UserModel({
    required this.name,
    required this.language,
    required this.imgPath,
    required this.enableNotification,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'language': language,
      'imgPath': imgPath,
      "enableNotification": enableNotification,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      enableNotification: map['enableNotification'],
      name: map['name'],
      language: map['language'],
      imgPath: map['imgPath'],
    );
  }
}
