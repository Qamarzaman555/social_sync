import 'package:flutter/material.dart';

class AppListTileTheme {
  AppListTileTheme._();

  // Cusomizable Light Icon Button Theme

  static final lightListTileTheme = ListTileThemeData(
    titleTextStyle: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    subtitleTextStyle: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );

  // Cusomizable Dark Icon Button Theme

  static final darkListTileTheme = ListTileThemeData(
    titleTextStyle: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    subtitleTextStyle: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5)),
  );
}
