import 'package:flutter/material.dart';
import 'package:hive_learn/presentation/views/home/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home View')),
      body: HomeViewBody(),
    );
  }
}
