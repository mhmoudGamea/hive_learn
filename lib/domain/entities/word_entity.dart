class WordEntity {
  final int index;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarities;
  final List<String> englishSimilarities;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordEntity({
    required this.index,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarities = const [],
    this.englishSimilarities = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordEntity copyWith({
    List<String>? arabicSimilarities,
    List<String>? englishSimilarities,
    List<String>? arabicExamples,
    List<String>? englishExamples,
  }) {
    return WordEntity(
      index: index,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarities: arabicSimilarities ?? this.arabicSimilarities,
      englishSimilarities: englishSimilarities ?? this.englishSimilarities,
      arabicExamples: arabicExamples ?? this.arabicExamples,
      englishExamples: englishExamples ?? this.englishExamples,
    );
  }

  WordEntity addSimilarWord(String word, {required bool isArabic}) {
    return isArabic
        ? copyWith(arabicSimilarities: [...arabicSimilarities, word])
        : copyWith(englishSimilarities: [...englishSimilarities, word]);
  }

  WordEntity deleteSimilarWord(int index, {required bool isArabic}) {
    final list = isArabic
        ? List<String>.from(arabicSimilarities)
        : List<String>.from(englishSimilarities);

    if (index >= 0 && index < list.length) {
      list.removeAt(index);
    }

    return isArabic
        ? copyWith(arabicSimilarities: list)
        : copyWith(englishSimilarities: list);
  }

  WordEntity addExample(String example, {required bool isArabic}) {
    return isArabic
        ? copyWith(arabicExamples: [...arabicExamples, example])
        : copyWith(englishExamples: [...englishExamples, example]);
  }

  WordEntity deleteExample(int index, {required bool isArabic}) {
    final list = isArabic
        ? List<String>.from(arabicExamples)
        : List<String>.from(englishExamples);

    if (index >= 0 && index < list.length) {
      list.removeAt(index);
    }

    return isArabic
        ? copyWith(arabicExamples: list)
        : copyWith(englishExamples: list);
  }
}
