import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_learn/data/models/word_hive_model.dart';

import 'core/utils/hive_boxes_names.dart';
import 'data/repos/word_repository_impl.dart';
import 'domain/repos/word_repository.dart';

final getIT = GetIt.instance;
Future<void> initGetIt() async {
  // HIVE BOXES
  getIT.registerLazySingleton<LazyBox<WordHiveModel>>(
    () => Hive.lazyBox<WordHiveModel>(HiveBoxesNames.wordBox),
  );

  // REPOSITORIES
  getIT.registerLazySingleton<WordRepository>(
    () => WordRepositoryImpl(box: getIT<LazyBox<WordHiveModel>>()),
  );
}
