import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppChipTheme {
  AppChipTheme._();

  // Cusomizable Light AppBar Theme

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );

  // Cusomizable Dark AppBar Theme

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: AppColors.darkerGrey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
