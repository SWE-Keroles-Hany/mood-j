class MoodEntity {
  String description;
  String emoji;
  DateTime moodDate;
  String? imgPath;
  String? audioPath;

  MoodEntity({
    required this.description,
    required this.emoji,
    this.audioPath,
    this.imgPath,
    required this.moodDate,
  });
}
