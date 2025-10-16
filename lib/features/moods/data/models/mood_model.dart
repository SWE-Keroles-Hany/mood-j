class MoodModel {
  String description;
  String emoji;
  int? id;
  DateTime? moodDate;
  String? imgPath;
  String? audioPath;

  MoodModel({
    this.id,
    required this.description,
    required this.emoji,
    this.moodDate,
    this.imgPath,
    this.audioPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'emoji': emoji,
      'imgPath': imgPath,
      'audioPath': audioPath,
      'moodDate': moodDate?.toIso8601String(),
    };
  }

  factory MoodModel.fromMap(Map<String, dynamic> map) {
    return MoodModel(
      id: map['id'],
      description: map['description'],
      emoji: map['emoji'],
      imgPath: map['imgPath'],
      audioPath: map['audioPath'],
      moodDate: map['moodDate'] != null
          ? DateTime.parse(map['moodDate'])
          : null,
    );
  }
}
