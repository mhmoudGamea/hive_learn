import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_learn/data/models/word_hive_model.dart';
import 'package:hive_learn/domain/repos/word_repository.dart';

import '../../../../domain/entities/word_entity.dart';
import 'write_data_states.dart';

class WriteDataCubit extends Cubit<WriteDataState> {
  final WordRepository repository;

  WriteDataCubit({required this.repository}) : super(WriteDataInitial());

  static WriteDataCubit get(BuildContext context) =>
      BlocProvider.of<WriteDataCubit>(context);

  // =========================
  // Public API
  // =========================

  /// Add a new word
  Future<void> addWord({
    required String text,
    required int colorCode,
    required bool isArabic,
  }) async {
    emit(WriteDataLoading());

    final entity = WordEntity(
      index: DateTime.now().millisecondsSinceEpoch % 0xFFFFFFFF,
      text: text,
      colorCode: colorCode,
      isArabic: isArabic,
    );

    await _saveEntity(entity);
  }

  /// Delete word by index
  Future<void> deleteWord(int index) async {
    emit(WriteDataLoading());

    final result = await repository.deleteWord(index);
    result.fold(
      (failure) => emit(WriteDataError(message: failure.message)),
      (_) => emit(WriteDataSuccess()),
    );
  }

  /// Add similar word
  Future<void> addSimilarWord({
    required int wordIndex,
    required String word,
    required bool isArabic,
  }) async {
    await _updateWord(
      wordIndex,
      (entity) => entity.addSimilarWord(word, isArabic: isArabic),
    );
  }

  /// Add example
  Future<void> addExample({
    required int wordIndex,
    required String example,
    required bool isArabic,
  }) async {
    await _updateWord(
      wordIndex,
      (entity) => entity.addExample(example, isArabic: isArabic),
    );
  }

  /// Delete similar word
  Future<void> deleteSimilarWord({
    required int parentWordIndex,
    required int similarWordIndex,
    required bool isArabic,
  }) async {
    await _updateWord(
      parentWordIndex,
      (entity) =>
          entity.deleteSimilarWord(similarWordIndex, isArabic: isArabic),
    );
  }

  /// Delete example
  Future<void> deleteExample({
    required int parentWordIndex,
    required int exampleIndex,
    required bool isArabic,
  }) async {
    await _updateWord(
      parentWordIndex,
      (entity) => entity.deleteExample(exampleIndex, isArabic: isArabic),
    );
  }

  // =========================
  // Internal helpers
  // =========================

  Future<void> _updateWord(
    int index,
    WordEntity Function(WordEntity oldEntity) update,
  ) async {
    emit(WriteDataLoading());

    final result = await repository.getSpecificWord(index);

    await result.fold(
      (failure) async {
        emit(WriteDataError(message: failure.message));
      },
      (model) async {
        final oldEntity = WordHiveModel.toEntity(model);
        final updatedEntity = update(oldEntity);
        await _saveEntity(updatedEntity);
      },
    );
  }

  Future<void> _saveEntity(WordEntity entity) async {
    final model = WordHiveModel.fromEntity(entity);
    log('index => ${model.index}');

    final result = await repository.putWord(model);
    result.fold((failure) {
      log('Fail => ${failure.message}');
      emit(WriteDataError(message: failure.message));
    }, (_) => emit(WriteDataSuccess()));
  }
}
