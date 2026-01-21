import 'package:test/test.dart';
import 'package:hive_learn/domain/entities/word_entity.dart';

void main() {
  group('WordEntity', () {
    test('addSimilarWord adds an Arabic similar word', () {
      final word = WordEntity(
        index: 0,
        text: 'Hello',
        isArabic: false,
        colorCode: 0xffd1d1d1,
      );
      final updatedWord = word.addSimilarWord('مرحبا', isArabic: true);
      expect(updatedWord.arabicSimilarities.length, 1);
      expect(updatedWord.arabicSimilarities.first, 'مرحبا');
      expect(updatedWord.englishSimilarities, isEmpty);
      expect(word.arabicSimilarities.isEmpty, true);
      expect(updatedWord.arabicSimilarities.isEmpty, false);
    });
  });
}
