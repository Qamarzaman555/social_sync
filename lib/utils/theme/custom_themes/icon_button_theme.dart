import 'package:flutter/material.dart';

class AppIconBtnTheme {
  AppIconBtnTheme._();

  // Cusomizable Light Icon Button Theme

  static const lightIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black)),
  );

  // Cusomizable Dark Icon Button Theme

  static const darkIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
  );
}
