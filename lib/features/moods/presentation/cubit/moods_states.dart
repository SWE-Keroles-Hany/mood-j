import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';

abstract class MoodsStates {}

class IntialMoodsState implements MoodsStates {}

//! Add
class LoadingAddMoodState implements MoodsStates {}

class ErrorAddMoodState implements MoodsStates {
  final String message;
  ErrorAddMoodState(this.message);
}

class SuccessAddMoodState implements MoodsStates {}

//! Delete
class LoadingDeleteMoodState implements MoodsStates {}

class ErrorDeleteMoodState implements MoodsStates {
  final String message;
  ErrorDeleteMoodState(this.message);
}

class SuccessDeleteMoodState implements MoodsStates {}

//! get all moods
class LoadingGetAllMoodsState implements MoodsStates {}

class ErrorGetAllMoodsState implements MoodsStates {
  final String message;
  ErrorGetAllMoodsState(this.message);
}

class SuccessGetAllMoodsState implements MoodsStates {
  final List<MoodEntity> allMoods;
  SuccessGetAllMoodsState(this.allMoods);
}

//! Most Frequent Mood States
class MostFrequentMoodLoading extends MoodsStates {}

class MostFrequentMoodLoaded extends MoodsStates {
  final MoodEntity? mood;
  MostFrequentMoodLoaded(this.mood);
}

class MostFrequentMoodError extends MoodsStates {
  final String message;
  MostFrequentMoodError(this.message);
}

//! Writing Streak States
class WritingStreakLoading extends MoodsStates {}

class WritingStreakLoaded extends MoodsStates {
  final int streak;
  WritingStreakLoaded(this.streak);
}

class WritingStreakError extends MoodsStates {
  final String message;
  WritingStreakError(this.message);
}

// ! Mood Today States
class MoodTodayLoading extends MoodsStates {}

class MoodTodayLoaded extends MoodsStates {
  final MoodEntity? mood;
  MoodTodayLoaded(this.mood);
}

class MoodTodayError extends MoodsStates {
  final String message;
  MoodTodayError(this.message);
}
