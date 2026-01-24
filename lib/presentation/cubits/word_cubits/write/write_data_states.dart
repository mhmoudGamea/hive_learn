abstract class WriteDataState {}

class WriteDataInitial extends WriteDataState {}

class WriteDataLoading extends WriteDataState {}

class WriteDataSuccess extends WriteDataState {}

class WriteDataError extends WriteDataState {
  final String message;
  WriteDataError({required this.message});
}
