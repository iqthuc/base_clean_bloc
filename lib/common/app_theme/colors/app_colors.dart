import 'package:base_clean_bloc/common/app_theme/colors/base_app_colors.dart';
import 'package:flutter/material.dart';

class AppColors {
  static final lightAppColors = BaseAppColors(
    primary: const Color(0xff6200ee),
    background: Colors.white,
  );

  static final darkAppColors = BaseAppColors(
    primary: const Color(0xffbb86fc),
    background: const Color(0xff121212),
  );
}
