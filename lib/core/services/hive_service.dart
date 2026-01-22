import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_learn/data/models/word_hive_model.dart';
import 'package:hive_learn/core/utils/hive_boxes_names.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    // Register adapters before opening any boxes
    _registerAdapters();
    // Open all required Hive boxes
    await _openBoxes();
  }

  /// Registers Hive adapters so custom models can be stored
  static void _registerAdapters() {
    Hive.registerAdapter(WordHiveModelAdapter());
  }

  /// Opens Hive boxes with error handling, LazyBox loads data only when accessed
  static Future<void> _openBoxes() async {
    try {
      await Hive.openLazyBox<WordHiveModel>(HiveBoxesNames.wordBox);
    } catch (error) {
      debugPrint("Hive error: $error");
    }
  }

  /// Provides access to the already opened WordModel box
  static LazyBox<WordHiveModel> get wordBox =>
      Hive.lazyBox<WordHiveModel>(HiveBoxesNames.wordBox);
}
