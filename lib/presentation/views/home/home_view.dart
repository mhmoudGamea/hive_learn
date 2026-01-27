import 'package:flutter/material.dart';
import 'package:hive_learn/core/styles/app_colors.dart';
import 'package:hive_learn/presentation/views/home/widgets/add_word_dialog.dart';
import 'package:hive_learn/presentation/views/home/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeViewBody()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(context: context, builder: (_) => AddWordDialog());
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
