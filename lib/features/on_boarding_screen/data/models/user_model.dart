class UserModel {
  String name;
  String language;
  String imgPath;

  UserModel({
    required this.name,
    required this.language,
    required this.imgPath,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'language': language, 'imgPath': imgPath};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      language: map['language'],
      imgPath: map['imgPath'],
    );
  }
}
