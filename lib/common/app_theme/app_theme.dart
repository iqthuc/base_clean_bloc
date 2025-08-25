import 'package:base_clean_bloc/common/index.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightColors = BaseColors.light;
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightColors.background,
    appBarTheme: AppBarTheme(backgroundColor: lightColors.background),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: lightColors.title),
    ),
    extensions: [
      AppColorTheme(
        colors: LightColors(),
      ),
    ],
  );

  static final darkColors = BaseColors.dark;
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkColors.background,
    appBarTheme: AppBarTheme(backgroundColor: darkColors.background),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: darkColors.title),
    ),
    extensions: [
      AppColorTheme(
        colors: DarkColors(),
      ),
    ],
  );
}

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppTextStyle get textStyles => AppTextStyle();
  BaseColors get appColors =>
      theme.extension<AppColorTheme>()?.colors ?? BaseColors.light;
}

class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final BaseColors colors;

  AppColorTheme({required this.colors});

  @override
  ThemeExtension<AppColorTheme> copyWith({BaseColors? colors}) {
    return AppColorTheme(colors: colors ?? this.colors);
  }

  @override
  ThemeExtension<AppColorTheme> lerp(
    ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme) {
      return this;
    }
    return AppColorTheme(
      colors: t < 0.5 ? colors : other.colors,
    );
  }
}
