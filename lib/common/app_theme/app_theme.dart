import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:base_clean_bloc/common/index.dart';
import 'package:base_clean_bloc/di/di_setup.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppTextStyle get textStyles => AppTextStyle();
  BaseColors get themeColors {
    final themeModeName = getIt<AppPreferences>().getThemeModeName();
    if (themeModeName == AdaptiveThemeMode.dark.name) {
      return DarkColors();
    } else {
      return LightColor();
    }
  }
}
