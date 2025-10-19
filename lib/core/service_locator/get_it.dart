import 'package:get_it/get_it.dart';
import 'package:moodly_j/features/moods/data/data_sources/moods_data_source.dart';
import 'package:moodly_j/features/moods/data/data_sources/sql_moods_data_source.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';
import 'package:moodly_j/features/moods/domain/repository/moods_repository_imp.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_all_moods.dart';
import 'package:moodly_j/features/moods/domain/use_cases/add_mood.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';

import '../../features/moods/domain/use_cases/delete_mood.dart';

final getIt = GetIt.instance;

void setup() {
  //! Moods
  getIt.registerSingleton<MoodsDataSource>(SqlMoodsDataSource());
  getIt.registerSingleton<MoodsRepository>(MoodsRepositoryImp(getIt()));
  getIt.registerSingleton<AddMood>(AddMood(getIt()));
  getIt.registerSingleton<DeleteMood>(DeleteMood(getIt()));
  getIt.registerSingleton<GetAllMoods>(GetAllMoods(getIt()));
  getIt.registerSingleton<MoodsCubit>(MoodsCubit(getIt(), getIt(), getIt()));
}
