import 'package:flutter/material.dart';

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

class ImageUtils {
  static const imagePath = 'assets/images/';
  static const backgr2 = '${imagePath}backgr2.jpeg';
  static const facebookIcon = '${imagePath}facebookIcon.png';
  static const googleIcon = '${imagePath}googleIcon.png';
}
