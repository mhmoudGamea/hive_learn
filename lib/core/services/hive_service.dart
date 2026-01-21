import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_learn/data/models/word_model.dart';
import 'package:hive_learn/core/utils/hive_boxes_names.dart';

import '../../data/models/word_type_adapter.dart';

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
    Hive.registerAdapter(WordTypeAdapter());
  }

  /// Opens Hive boxes with error handling, LazyBox loads data only when accessed
  static Future<void> _openBoxes() async {
    try {
      await Hive.openLazyBox<WordModel>(HiveBoxesNames.userBox);
    } catch (error) {
      debugPrint("Hive error: $error");
    }
  }

  /// Provides access to the already opened WordModel box
  static LazyBox<WordModel> get userBox =>
      Hive.lazyBox<WordModel>(HiveBoxesNames.userBox);
}
