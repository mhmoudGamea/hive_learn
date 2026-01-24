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

  /// Adds a new word to local database.
  void addWord({
    required String word,
    required int colorCode,
    required bool isArabic,
  }) async {
    emit(WriteDataLoading());
    try {
      final wordEntity = WordEntity(
        index: DateTime.now().millisecondsSinceEpoch,
        text: word,
        colorCode: colorCode,
        isArabic: isArabic,
      );
      final wordHiveModel = WordHiveModel.fromEntity(wordEntity);
      final result = await repository.addWord(wordHiveModel);
      result.fold(
        (failure) => emit(WriteDataError(message: failure.message)),
        (_) => emit(WriteDataSuccess()),
      );
    } catch (error) {
      emit(WriteDataError(message: error.toString()));
    }
  }

  /// Delete an exact word from local database.
  void deleteWord(int index) async {
    emit(WriteDataLoading());
    try {
      // Assuming repository has a deleteWord method
      final result = await repository.deleteWord(index);
      result.fold(
        (failure) => emit(WriteDataError(message: failure.message)),
        (_) => emit(WriteDataSuccess()),
      );
    } catch (error) {
      emit(WriteDataError(message: error.toString()));
    }
  }
}
