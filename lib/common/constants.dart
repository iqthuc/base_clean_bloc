import 'package:flutter/material.dart';

const double kStatusBarHeight = 24;

const double kIconSize16 = 16;
const double kIconSize24 = 24;
const double kIconSize32 = 32;
const double kIconSize48 = 48;

const double kSpace4 = 4;
const double kSpace8 = 8;
const double kSpace12 = 12;
const double kSpace16 = 16;
const double kSpace24 = 24;
const double kSpace32 = 32;
const double kSpace48 = 48;

const double kRadius8 = 8;
const double kRadius12 = 12;
const double kRadius16 = 16;
const double kRadius24 = 24;

class LocalizationConstants {
  static const Locale viLocale = Locale('vi', 'VN');
  static const Locale enUSLocale = Locale('en', 'US');
  static const path = 'assets/translations';
}

class NotificationConfig {
  static const highImportance = "High Importance channel";
  static const highChannelId = "flutter_channel_id_0";
  static const highChannelDescription = "Floating notification with sound";
  static const notificationIconPath = 'ic_notification';
}

class SQLiteConfig {
  static const String dbName = 'base_clean_bloc.db';
  static const int dbVersion = 1;
}

class ImageUtils {
  static const imagePath = 'assets/images/';
  static const backgr2 = '${imagePath}backgr2.jpeg';
  static const facebookIcon = '${imagePath}facebookIcon.png';
  static const googleIcon = '${imagePath}googleIcon.png';
}
