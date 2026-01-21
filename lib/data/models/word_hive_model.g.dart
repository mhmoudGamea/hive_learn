// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordHiveModelAdapter extends TypeAdapter<WordHiveModel> {
  @override
  final int typeId = 0;

  @override
  WordHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordHiveModel(
      index: fields[0] as int,
      text: fields[1] as String,
      isArabic: fields[2] as bool,
      colorCode: fields[3] as int,
      arabicSimilarities: (fields[4] as List).cast<String>(),
      englishSimilarities: (fields[5] as List).cast<String>(),
      arabicExamples: (fields[6] as List).cast<String>(),
      englishExamples: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, WordHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isArabic)
      ..writeByte(3)
      ..write(obj.colorCode)
      ..writeByte(4)
      ..write(obj.arabicSimilarities)
      ..writeByte(5)
      ..write(obj.englishSimilarities)
      ..writeByte(6)
      ..write(obj.arabicExamples)
      ..writeByte(7)
      ..write(obj.englishExamples);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
