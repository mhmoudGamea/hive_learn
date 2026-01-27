import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_learn/core/utils/enums.dart';
import 'package:hive_learn/domain/repos/word_repository.dart';

import '../../../../data/models/word_hive_model.dart';
import '../../../../domain/entities/word_entity.dart';
import 'read_data_states.dart';

class ReadDataCubit extends Cubit<ReadDataState> {
  final WordRepository repository;
  ReadDataCubit({required this.repository}) : super(ReadDataInitial());

  static ReadDataCubit get(BuildContext context) =>
      BlocProvider.of<ReadDataCubit>(context);

  LanguageFilter languageFilter = LanguageFilter.all;
  SortedBy sortedBy = SortedBy.time;
  SortingOrder sortingOrder = SortingOrder.descending;

  void updateLanguageFilter(LanguageFilter filter) {
    languageFilter = filter;
    getWords();
  }

  void updateSortedBy(SortedBy filter) {
    sortedBy = filter;
    getWords();
  }

  void updateSortingOrder(SortingOrder filter) {
    sortingOrder = filter;
    getWords();
  }

  void getWords() async {
    emit(ReadDataLoading());
    try {
      final result = await repository.getWords();
      result.fold((failure) => emit(ReadDataError(message: failure.message)), (
        words,
      ) {
        List<WordEntity> wordEntities = words
            .map(WordHiveModel.toEntity)
            .toList();
        wordEntities = _applyLanguageFilter(wordEntities);
        wordEntities = _applySortingBy(wordEntities);
        wordEntities = _applySortingOrder(wordEntities);
        emit(ReadDataSuccess(words: wordEntities));
      });
    } catch (e) {
      emit(ReadDataError(message: e.toString()));
    }
  }

  List<WordEntity> _applyLanguageFilter(List<WordEntity> words) {
    switch (languageFilter) {
      case LanguageFilter.arabic:
        return words.where((word) => word.isArabic).toList();
      case LanguageFilter.english:
        return words.where((word) => !word.isArabic).toList();
      case LanguageFilter.all:
        return words;
    }
  }

  List<WordEntity> _applySortingBy(List<WordEntity> words) {
    List<WordEntity> sortedByWords = List.from(words);
    switch (sortedBy) {
      case SortedBy.time:
        sortedByWords.sort((a, b) => a.index.compareTo(b.index));
        break;
      case SortedBy.wordLength:
        sortedByWords.sort((a, b) => a.text.length.compareTo(b.text.length));
        break;
    }
    return sortedByWords;
  }

  List<WordEntity> _applySortingOrder(List<WordEntity> words) {
    if (sortingOrder == SortingOrder.descending) {
      return List.from(words.reversed);
    }
    return words;
  }
}
