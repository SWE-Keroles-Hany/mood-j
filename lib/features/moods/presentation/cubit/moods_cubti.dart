import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_all_moods.dart';
import 'package:moodly_j/features/moods/domain/use_cases/add_mood.dart';
import 'package:moodly_j/features/moods/domain/use_cases/delete_mood.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_mood_today.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_most_frequent_mood.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_writing_streak.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_states.dart';

class MoodsCubit extends Cubit<MoodsStates> {
  final AddMood _addMood;
  final DeleteMood _deleteMood;
  final GetAllMoods _getAllMoods;
  final GetMoodToday _getMoodToday;
  final GetWritingStreak _getWritingStreak;
  final GetMostFrequentMood _getMostFrequentMood;

  List<MoodEntity> moods = [];

  MoodsCubit(
    this._addMood,
    this._deleteMood,
    this._getAllMoods,
    this._getMoodToday,
    this._getWritingStreak,
    this._getMostFrequentMood,
  ) : super(IntialMoodsState());

  Future<void> addMood({required MoodEntity moodEntity}) async {
    emit(LoadingAddMoodState());
    final result = await _addMood.addMood(moodEntity: moodEntity);
    result.fold((failulre) {
      emit(ErrorAddMoodState(failulre.message));
    }, (_) => emit(SuccessAddMoodState()));
  }

  Future<void> deleteMode({required int moodId}) async {
    emit(LoadingDeleteMoodState());
    final result = await _deleteMood.deleteMode(moodId: moodId);
    result.fold((failulre) {
      emit(ErrorDeleteMoodState(failulre.message));
    }, (_) => emit(SuccessDeleteMoodState()));
  }

  Future<void> getAllMoods() async {
    emit(LoadingGetAllMoodsState());
    final result = await _getAllMoods.getAllMoods();
    result.fold(
      (failulre) {
        emit(ErrorGetAllMoodsState(failulre.message));
      },
      (result) {
        moods = result;
        emit(SuccessGetAllMoodsState(result));
      },
    );
  }

  Future<void> getMoodToday() async {
    emit(MoodTodayLoading());
    final result = await _getMoodToday.getMoodToday();
    result.fold(
      (failulre) {
        emit(MoodTodayError(failulre.message));
      },
      (result) {
        emit(MoodTodayLoaded(result));
      },
    );
  }

  Future<void> getMostFrequentMood() async {
    emit(MostFrequentMoodLoading());
    final result = await _getMostFrequentMood.getMostFrequentMood();
    result.fold(
      (failulre) {
        emit(MostFrequentMoodError(failulre.message));
      },
      (result) {
        emit(MostFrequentMoodLoaded(result!));
      },
    );
  }

  Future<void> getWritingStreak() async {
    emit(WritingStreakLoading());
    final result = await _getWritingStreak.getWritingStreak();
    result.fold(
      (failulre) {
        emit(WritingStreakError(failulre.message));
      },
      (result) {
        emit(WritingStreakLoaded(result));
      },
    );
  }
}
