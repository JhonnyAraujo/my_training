import 'package:flutter/material.dart';
import 'package:my_training/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.neutral[900],),
      scaffoldBackgroundColor: AppColors.neutral[900],
      cardTheme: CardThemeData(
        color: AppColors.neutral[800]
      )
    );
  }
}