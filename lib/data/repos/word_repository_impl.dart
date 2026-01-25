import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../../core/error/failure.dart';
import '../../domain/repos/word_repository.dart';
import '../models/word_hive_model.dart';

class WordRepositoryImpl implements WordRepository {
  final LazyBox<WordHiveModel> box;

  WordRepositoryImpl({required this.box});

  @override
  Future<Either<Failure, List<WordHiveModel>>> getWords() async {
    try {
      final words = <WordHiveModel>[];

      for (final key in box.keys) {
        final word = await box.get(key);
        if (word != null) words.add(word);
      }

      return Right(words);
    } catch (e) {
      return Left(CacheFailure('Failed to load words'));
    }
  }

  @override
  Future<Either<Failure, void>> putWord(WordHiveModel word) async {
    try {
      await box.put(word.index, word);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to save word'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWord(int index) async {
    try {
      return box.delete(index).then((_) => const Right(null));
    } catch (e) {
      return Left(CacheFailure('Failed to delete word'));
    }
  }

  @override
  Future<Either<Failure, WordHiveModel>> getSpecificWord(int index) async {
    try {
      final word = await box.get(index);
      if (word != null) {
        return Right(word);
      } else {
        return Left(CacheFailure('Word not found'));
      }
    } catch (error) {
      return Left(CacheFailure('Failed to get specific word'));
    }
  }
}
