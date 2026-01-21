import 'package:flutter/material.dart';
import 'package:hive_learn/core/services/hive_service.dart';
import 'package:hive_learn/presentation/test_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TestScreen());
  }
}
