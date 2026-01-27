import 'package:flutter/material.dart';
import 'package:hive_learn/core/styles/app_colors.dart';
import 'package:hive_learn/domain/entities/word_entity.dart';

class GridViewWidgets extends StatelessWidget {
  const GridViewWidgets({super.key, required this.words});

  final List<WordEntity> words;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: words.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (_, index) {
        return _getGridItem(words[index]);
      },
    );
  }

  Widget _getGridItem(WordEntity word) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(word.colorCode),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Text(
          word.text,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
