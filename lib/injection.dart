import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_learn/data/models/word_hive_model.dart';

import 'core/utils/hive_boxes_names.dart';
import 'data/repos/word_repository_impl.dart';
import 'domain/repos/word_repository.dart';
import 'presentation/cubits/word_cubits/read/read_data_cubit.dart';
import 'presentation/cubits/word_cubits/write/write_data_cubit.dart';

final getIt = GetIt.instance;
Future<void> initGetIt() async {
  // HIVE BOXES
  getIt.registerLazySingleton<LazyBox<WordHiveModel>>(
    () => Hive.lazyBox<WordHiveModel>(HiveBoxesNames.wordBox),
  );

  // REPOSITORIES
  getIt.registerLazySingleton<WordRepository>(
    () => WordRepositoryImpl(box: getIt<LazyBox<WordHiveModel>>()),
  );

  // CUBITS
  getIt.registerFactory(
    () => WriteDataCubit(repository: getIt<WordRepository>()),
  );
  getIt.registerFactory(
    () => ReadDataCubit(repository: getIt<WordRepository>()),
  );
}
