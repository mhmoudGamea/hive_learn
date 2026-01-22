import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../data/models/word_hive_model.dart';

abstract class WordRepository {
  Future<Either<Failure, List<WordHiveModel>>> getAllWords();
  Future<Either<Failure, void>> addWord(WordHiveModel word);
}
