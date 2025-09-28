import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.colorWhite),
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
  );
}
