import '../../../../domain/entities/word_entity.dart';

abstract class ReadDataState {}

class ReadDataInitial extends ReadDataState {}

class ReadDataLoading extends ReadDataState {}

class ReadDataSuccess extends ReadDataState {
  final List<WordEntity> words;
  ReadDataSuccess({required this.words});
}

class ReadDataFailure extends ReadDataState {
  final String message;
  ReadDataFailure({required this.message});
}
