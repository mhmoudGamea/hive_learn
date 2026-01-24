import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_learn/core/utils/enums.dart';
import 'package:hive_learn/domain/repos/word_repository.dart';

import '../../../../data/models/word_hive_model.dart';
import '../../../../domain/entities/word_entity.dart';
import 'read_data_states.dart';

class ReadDataCubit extends Cubit<ReadDataState> {
  final WordRepository repository;
  ReadDataCubit({required this.repository}) : super(ReadDataInitial());

  static get(context) => BlocProvider.of<ReadDataCubit>(context);

  LanguageFilter languageFilter = LanguageFilter.all;
  SortedBy sortedBy = SortedBy.time;
  SortingOrder sortingOrder = SortingOrder.descending;

  void updateLanguageFilter(LanguageFilter filter) {
    languageFilter = filter;
  }

  void updateSortedBy(SortedBy filter) {
    sortedBy = filter;
  }

  void updateSortingOrder(SortingOrder filter) {
    sortingOrder = filter;
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
        emit(ReadDataSuccess(words: wordEntities));
      });
    } catch (e) {
      emit(ReadDataError(message: e.toString()));
    }
  }
}
