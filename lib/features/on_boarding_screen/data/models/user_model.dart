class UserModel {
  String name;
  DateTime? notificationTime;
  String? language;
  String? theme;
  String? todayMood;
  String? mostFrequent;
  int? totalMoods;
  int? writingStreak;

  UserModel({
    required this.name,
    this.language = "en",
    this.mostFrequent,
    this.notificationTime,
    this.theme = "light",
    this.todayMood,
    this.totalMoods = 0,
    this.writingStreak = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'notificationTime': notificationTime?.toIso8601String(),
      'language': language,
      'theme': theme,
      'todayMood': todayMood,
      'mostFrequent': mostFrequent,
      'totalMoods': totalMoods,
      'writingStreak': writingStreak,
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
      todayMood: map['todayMood'],
      mostFrequent: map['mostFrequent'],
      totalMoods: map['totalMoods'] ?? 0,
      writingStreak: map['writingStreak'] ?? 0,
    );
  }
}
