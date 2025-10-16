import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly_j/features/moods/domain/entities/mood_entity.dart';
import 'package:moodly_j/features/moods/domain/use_cases/add_mood%20copy.dart';
import 'package:moodly_j/features/moods/domain/use_cases/add_mood.dart';
import 'package:moodly_j/features/moods/domain/use_cases/delete_mood.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_states.dart';

class MoodsCubit extends Cubit<MoodsStates> {
  final AddMood _addMood;
  final DeleteMood _deleteMood;
  final GetAllMoods _getAllMoods;

  MoodsCubit(this._addMood, this._deleteMood, this._getAllMoods)
    : super(IntialMoodsState());

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
    result.fold((failulre) {
      emit(ErrorGetAllMoodsState(failulre.message));
    }, (result) => emit(SuccessGetAllMoodsState(result)));
  }
}
