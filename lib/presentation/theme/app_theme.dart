import 'package:flutter/material.dart';
import 'package:form_app/core/constants/app_colors.dart';

class AppTheme {
  ThemeData get appTheme {
    return ThemeData(
      fontFamily: 'Sarabun',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.font,
        ),
      ),
    );
  }
}
