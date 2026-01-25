import 'package:flutter/material.dart';
import 'package:hive_learn/core/services/hive_service.dart';
import 'package:hive_learn/core/styles/app_theme.dart';
import 'package:hive_learn/injection.dart';
import 'package:hive_learn/presentation/views/home/home_view.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeView(),
    );
  }
}
