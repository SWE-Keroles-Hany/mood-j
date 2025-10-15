class MoodModel {
  int id;
  String description;
  String emoji;
  String? imgPath;
  String? audioPath;
  MoodModel(
    this.imgPath,
    this.description,
    this.emoji,
    this.id,
    this.audioPath,
  );
}
