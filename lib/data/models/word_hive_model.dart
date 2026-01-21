import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_learn/domain/entities/word_entity.dart';

part 'word_hive_model.g.dart';
@HiveType(typeId: 0)
class WordHiveModel {
  @HiveField(0)
  final int index;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final bool isArabic;
  @HiveField(3)
  final int colorCode;
  @HiveField(4)
  final List<String> arabicSimilarities;
  @HiveField(5)
  final List<String> englishSimilarities;
  @HiveField(6)
  final List<String> arabicExamples;
  @HiveField(7)
  final List<String> englishExamples;

  const WordHiveModel({
    required this.index,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarities = const [],
    this.englishSimilarities = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordEntity toEntity() {
    return WordEntity(
      index: index,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarities: arabicSimilarities,
      englishSimilarities: englishSimilarities,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  // factory WordHiveModel.fromEntity(WordEntity word) {
  //   return WordHiveModel(
  //     index: word.index,
  //     text: word.text,
  //     isArabic: word.isArabic,
  //     colorCode: word.colorCode,
  //     arabicSimilarities: word.arabicSimilarities,
  //     englishSimilarities: word.englishSimilarities,
  //     arabicExamples: word.arabicExamples,
  //     englishExamples: word.englishExamples,
  //   );
  // }
}
