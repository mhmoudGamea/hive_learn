import 'package:hive/hive.dart';
import 'package:hive_learn/data/models/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader) {
    return WordModel(
      index: reader.readInt(),
      text: reader.readString(),
      isArabic: reader.readBool(),
      colorCode: reader.readInt(),
      arabicSimilarities: reader.readStringList(),
      englishSimilarities: reader.readStringList(),
      arabicExamples: reader.readStringList(),
      englishExamples: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer.writeInt(obj.index);
    writer.writeString(obj.text);
    writer.writeBool(obj.isArabic);
    writer.writeInt(obj.colorCode);
    writer.writeStringList(obj.arabicSimilarities);
    writer.writeStringList(obj.englishSimilarities);
    writer.writeStringList(obj.arabicExamples);
    writer.writeStringList(obj.englishExamples);
  }
}
