class WordModel {
  final int index;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarities;
  final List<String> englishSimilarities;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.index,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarities = const [],
    this.englishSimilarities = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  /// Internal helper to rebuild WordModel with updated lists
  WordModel _copyWith({
    List<String>? arabicSimilarities,
    List<String>? englishSimilarities,
    List<String>? arabicExamples,
    List<String>? englishExamples,
  }) {
    return WordModel(
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

  /// Delete a similar word by index
  WordModel deleteSimilarWord({
    required int wordIndex,
    required bool isArabicSimilarWord,
  }) {
    if (isArabicSimilarWord) {
      final newArabic = List<String>.from(arabicSimilarities);
      if (wordIndex >= 0 && wordIndex < newArabic.length) {
        newArabic.removeAt(wordIndex);
      }
      return _copyWith(arabicSimilarities: newArabic);
    } else {
      final newEnglish = List<String>.from(englishSimilarities);
      if (wordIndex >= 0 && wordIndex < newEnglish.length) {
        newEnglish.removeAt(wordIndex);
      }
      return _copyWith(englishSimilarities: newEnglish);
    }
  }

  /// Adds a new similar word
  WordModel addSimilarWord({
    required String similarWord,
    required bool isArabicSimilarWord,
  }) {
    if (isArabicSimilarWord) {
      final newArabic = [...arabicSimilarities, similarWord];
      return _copyWith(arabicSimilarities: newArabic);
    } else {
      final newEnglish = [...englishSimilarities, similarWord];
      return _copyWith(englishSimilarities: newEnglish);
    }
  }

  /// Delete an example by index
  WordModel deleteExample({
    required int exampleIndex,
    required bool isArabicExample,
  }) {
    if (isArabicExample) {
      final newExamples = List<String>.from(arabicExamples);
      if (exampleIndex >= 0 && exampleIndex < newExamples.length) {
        newExamples.removeAt(exampleIndex);
      }
      return _copyWith(arabicExamples: newExamples);
    } else {
      final newExamples = List<String>.from(englishExamples);
      if (exampleIndex >= 0 && exampleIndex < newExamples.length) {
        newExamples.removeAt(exampleIndex);
      }
      return _copyWith(englishExamples: newExamples);
    }
  }

  /// Add a new example
  WordModel addExample({
    required String example,
    required bool isArabicExample,
  }) {
    if (isArabicExample) {
      final newExamples = [...arabicExamples, example];
      return _copyWith(arabicExamples: newExamples);
    } else {
      final newExamples = [...englishExamples, example];
      return _copyWith(englishExamples: newExamples);
    }
  }
}
