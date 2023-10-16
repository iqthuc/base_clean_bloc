import 'package:base_clean_bloc/common/app_theme/colors/app_colors.dart';
import 'package:base_clean_bloc/common/index.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get getThemeMode => _themeMode;
  set setThemeMode(ThemeMode thememode) {
    _themeMode = thememode;
  }

  static final light = ThemeData.light().copyWith(
    extensions: [
      AppColors.lightAppColors,
    ],
  );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      AppColors.darkAppColors,
    ],
  );
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppTextStyle get textStyle => AppTextStyle();
}
