import 'package:flutter/material.dart';

class AppTextBtnTheme {
  AppTextBtnTheme._();

  // Cusomizable Light Text Button Theme

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 12),
      textStyle: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );

  // Cusomizable Dark Text Button Theme

  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 4),
      textStyle: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
