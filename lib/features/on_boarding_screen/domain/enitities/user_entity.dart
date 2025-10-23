class UserEntity {
  String name;
  DateTime? notificationTime;
  String? language;
  String? theme;
  String? todayMood;
  String? mostFrequent;
  int? totalMoods;
  int? writingStreak;

  UserEntity({
    required this.name,
    this.language,
    this.mostFrequent,
    this.notificationTime,
    this.theme,
    this.todayMood,
    this.totalMoods,
    this.writingStreak,
  });
}
