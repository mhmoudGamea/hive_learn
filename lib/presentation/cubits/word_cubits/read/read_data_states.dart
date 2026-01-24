import '../../../../domain/entities/word_entity.dart';

abstract class ReadDataState {}

class ReadDataInitial extends ReadDataState {}

class ReadDataLoading extends ReadDataState {}

class ReadDataSuccess extends ReadDataState {
  final List<WordEntity> words;
  ReadDataSuccess({required this.words});
}

class ReadDataError extends ReadDataState {
  final String message;
  ReadDataError({required this.message});
}
