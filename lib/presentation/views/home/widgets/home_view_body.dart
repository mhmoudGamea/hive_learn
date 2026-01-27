import 'package:flutter/material.dart';
import 'package:hive_learn/presentation/views/home/widgets/words_grid_widget.dart';
import 'package:hive_learn/presentation/views/home/widgets/words_language_filter_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Filter section
          const SizedBox(height: 10),
          WordsLanguageFilterWidget(),

          // Words grid
          const SizedBox(height: 10),
          Expanded(child: WordsGridWidget()),
        ],
      ),
    );
  }
}
