import '../../../../domain/entities/word_entity.dart';

abstract class WriteDataState {}

class WriteDataInitial extends WriteDataState {}

class WriteDataLoading extends WriteDataState {}

class WriteDataSuccess extends WriteDataState {
  final List<WordEntity> words;
  WriteDataSuccess({required this.words});
}

class WriteDataFailure extends WriteDataState {
  final String message;
  WriteDataFailure({required this.message});
}
