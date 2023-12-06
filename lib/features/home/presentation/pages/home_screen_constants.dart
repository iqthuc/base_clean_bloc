import 'package:base_clean_bloc/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class HomeScreenConstants {
  static const homeHeaderImageSizeRatio = 750 / 1125;
  static final homeHeaderImageSize = Size(1.sw, 1.sw * homeHeaderImageSizeRatio);

  static final dragSheetHeightInitalHeight = 1.sh - homeHeaderImageSize.height + kRadius16 + kStatusBarHeight;

  /// tỷ lệ chiều cao của dragSheet so với widget cha
  static final double dragSheetRatio = dragSheetHeightInitalHeight / (1.sh);

  /// chiều cao tính từ điểm 0 đến điểm đầu của DragSheet
  static final double controllerOpacityHeight = 1.sh - dragSheetHeightInitalHeight;

  static const EdgeInsets smallCategoryItemListPadding = EdgeInsets.only(left: kSpace16, right: kSpace16);
  static final double smallCategoryItemWidth = (1.sw - smallCategoryItemListPadding.horizontal - kSpace16 * 4) / 5;
}
