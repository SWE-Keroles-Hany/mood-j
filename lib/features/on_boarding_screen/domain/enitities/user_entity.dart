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
    this.language = 'en',
    this.mostFrequent = '--',
    this.notificationTime,
    this.theme = 'light',
    this.todayMood = '--',
    this.totalMoods = 0,
    this.writingStreak = 0,
  });
}
