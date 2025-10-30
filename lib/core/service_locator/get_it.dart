import 'package:get_it/get_it.dart';
import 'package:moodly_j/core/data_base/local_data_base.dart';
import 'package:moodly_j/features/moods/data/data_sources/moods_data_source.dart';
import 'package:moodly_j/features/moods/data/data_sources/sql_moods_data_source.dart';
import 'package:moodly_j/features/moods/data/repository/moods_repository.dart';
import 'package:moodly_j/features/moods/domain/repository/moods_repository_imp.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_all_moods.dart';
import 'package:moodly_j/features/moods/domain/use_cases/add_mood.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_mood_today.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_most_frequent_mood.dart';
import 'package:moodly_j/features/moods/domain/use_cases/get_writing_streak.dart';
import 'package:moodly_j/features/moods/presentation/cubit/moods_cubti.dart';
import 'package:moodly_j/features/on_boarding_screen/data/data_sources/sql_user_data_source.dart';
import 'package:moodly_j/features/on_boarding_screen/data/data_sources/user_data_source.dart';
import 'package:moodly_j/features/on_boarding_screen/data/repository/user_repo.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/repository/user_repo_imp.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/change_image.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/change_language.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/change_user_name.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/create_user.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/get_user.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/is_user_created.dart';
import 'package:moodly_j/features/on_boarding_screen/domain/use_cases/log_out.dart';
import 'package:moodly_j/features/on_boarding_screen/presentation/cubit/user_cubit.dart';

import '../../features/moods/domain/use_cases/delete_mood.dart';

final getIt = GetIt.instance;

void setup() {
  //! Moods
  getIt.registerSingleton<LocalDatabase>(LocalDatabase());
  getIt.registerSingleton<MoodsDataSource>(SqlMoodsDataSource(getIt()));
  getIt.registerSingleton<MoodsRepository>(MoodsRepositoryImp(getIt()));
  getIt.registerSingleton<AddMood>(AddMood(getIt()));
  getIt.registerSingleton<DeleteMood>(DeleteMood(getIt()));
  getIt.registerSingleton<GetAllMoods>(GetAllMoods(getIt()));
  getIt.registerSingleton<GetMoodToday>(GetMoodToday(getIt()));
  getIt.registerSingleton<GetWritingStreak>(GetWritingStreak(getIt()));
  getIt.registerSingleton<GetMostFrequentMood>(GetMostFrequentMood(getIt()));

  getIt.registerSingleton<MoodsCubit>(
    MoodsCubit(getIt(), getIt(), getIt(), getIt(), getIt(), getIt()),
  );

  //! User
  getIt.registerSingleton<UserDataSource>(SqlUserDataSource(getIt()));
  getIt.registerSingleton<UserRepo>(UserRepoImp(getIt()));
  getIt.registerSingleton<CreateUser>(CreateUser(getIt()));
  getIt.registerSingleton<GetUser>(GetUser(getIt()));
  getIt.registerSingleton<IsUserCreated>(IsUserCreated(getIt()));
  getIt.registerSingleton<ChangeImage>(ChangeImage(getIt()));
  getIt.registerSingleton<ChangeLanguage>(ChangeLanguage(getIt()));
  getIt.registerSingleton<ChangeUserName>(ChangeUserName(getIt()));
  getIt.registerSingleton<LogOut>(LogOut(getIt()));

  getIt.registerSingleton<UserCubit>(
    UserCubit(getIt(), getIt(), getIt(), getIt(), getIt(), getIt(), getIt()),
  );
}
