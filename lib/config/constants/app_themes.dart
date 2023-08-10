import 'package:flutter/material.dart';
import 'constants.dart';

normalTheme() {
  return ThemeData().copyWith(
      useMaterial3: true,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: WHITE_COLOR,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          surfaceTintColor: WHITE_COLOR,
          backgroundColor: PRIMARY_COLOR,
          foregroundColor: WHITE_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      textTheme: const TextTheme().copyWith(
          bodySmall: STYLE_SMALL,
          bodyMedium: STYLE_MEDIUM,
          titleMedium: STYLE_MEDIUM_BOLD,
          titleSmall: STYLE_SMALL_BOLD),
      buttonTheme: const ButtonThemeData().copyWith(
        buttonColor: WHITE_COLOR,
      ),
      cardTheme: const CardTheme().copyWith(surfaceTintColor: WHITE_COLOR));
}
