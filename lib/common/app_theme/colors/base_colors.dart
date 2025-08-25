import 'package:base_clean_bloc/common/index.dart';
import 'package:flutter/material.dart';

abstract class BaseColors {
  static final light = LightColors();
  static final dark = DarkColors();
  Color get background;
  Color get title;
}
