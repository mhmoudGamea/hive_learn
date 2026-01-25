import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_learn/core/services/hive_service.dart';
import 'package:hive_learn/core/styles/app_theme.dart';
import 'package:hive_learn/injection.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/read/read_data_cubit.dart';
import 'package:hive_learn/presentation/views/home/home_view.dart';

import 'presentation/cubits/word_cubits/write/write_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<WriteDataCubit>()),
        BlocProvider(create: (_) => getIt<ReadDataCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const HomeView(),
      ),
    );
  }
}
