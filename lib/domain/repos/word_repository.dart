import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../data/models/word_hive_model.dart';

abstract class WordRepository {
  Future<Either<Failure, List<WordHiveModel>>> getWords();
  Future<Either<Failure, void>> putWord(WordHiveModel word);
  Future<Either<Failure, void>> deleteWord(int index);
  Future<Either<Failure, WordHiveModel>> getSpecificWord(int index);
}
