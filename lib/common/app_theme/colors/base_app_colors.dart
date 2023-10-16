import 'package:flutter/material.dart';

class BaseAppColors extends ThemeExtension<BaseAppColors> {
  BaseAppColors({
    required this.primary,
    required this.background,
  });

  final Color primary;
  final Color background;

  @override
  ThemeExtension<BaseAppColors> copyWith({
    Color? primary,
    Color? background,
  }) {
    return BaseAppColors(
      primary: primary ?? this.primary,
      background: background ?? this.background,
    );
  }

  @override
  ThemeExtension<BaseAppColors> lerp(
    covariant ThemeExtension<BaseAppColors>? other,
    double t,
  ) {
    if (other is! BaseAppColors) {
      return this;
    }

    return BaseAppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}
