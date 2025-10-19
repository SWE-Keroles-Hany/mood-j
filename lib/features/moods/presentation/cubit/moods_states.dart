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

//! get all moods
class LoadingGetImg implements MoodsStates {}

class ErrorGetImg implements MoodsStates {}

class SuccessGetImg implements MoodsStates {
  final String path;
  SuccessGetImg(this.path);
}
