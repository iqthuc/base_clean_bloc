import 'package:flutter/material.dart';

class AppTextStyle {
  final TextTheme _appTextTheme = const TextTheme(
      labelLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
      ),
      bodyLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
      ));

  TextStyle get myTextStyle => _appTextTheme.bodyLarge!;
  TextStyle get myTextSTyle2 => _appTextTheme.labelLarge!;
}
