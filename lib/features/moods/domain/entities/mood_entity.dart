class MoodEntity {
  String description;
  String emoji;
  DateTime moodDate;
  String? imgPath;
  String? audioPath;

  MoodEntity({
    required this.description,
    required this.emoji,
    required this.moodDate,
    this.audioPath,
    this.imgPath,
  });
}
