import 'package:adaptive_theme/adaptive_theme.dart';

abstract class AppPreferences {
  Future<T?> get<T>(String key);

  Future<bool> validateKey(String key);

  Future<bool> remove(String key);

  Future<bool> clearSession();

  Future<void> reload();

  Future<dynamic> save(String key, dynamic value);

  Future<bool> saveThemeModeName(AdaptiveThemeMode themeMode);
  String getThemeModeName();
}
