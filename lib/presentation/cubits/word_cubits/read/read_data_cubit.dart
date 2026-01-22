import 'package:flutter_bloc/flutter_bloc.dart';

import 'read_data_states.dart';

class ReadDataCubit extends Cubit<ReadDataState> {
  static get(context) => BlocProvider.of<ReadDataCubit>(context);
  ReadDataCubit(ReadDataInitial super.state);
}
