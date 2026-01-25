import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

abstract class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 23,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.secondaryColor,
      selectionColor: AppColors.secondaryColor.withValues(alpha: 0.5),
      selectionHandleColor: AppColors.secondaryColor,
    ),
  );
}
