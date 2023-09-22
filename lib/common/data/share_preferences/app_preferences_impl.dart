import 'package:base_clean_bloc/common/index.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AppPreferences)
class AppPreferencesImpl extends AppPreferences {
  Future<dynamic> _doWork(Function(SharedPreferences) work) {
    return SharedPreferences.getInstance().then(work).catchError((e) => throw Exception(e));
  }

  @override
  Future<T?> get<T>(String key) async {
    return await _doWork((pref) {
      return (pref.containsKey(key)) ? pref.get(key) : null;
    }).catchError((e) => throw Exception(e)) as T?;
  }

  @override
  Future<bool> validateKey(String key) async {
    return await _doWork((pref) {
      return pref.containsKey(key);
    }).catchError((e) => throw Exception(e)) as bool;
  }

  @override
  Future<bool> remove(String key) async {
    return await _doWork((pref) {
      return pref.remove(key);
    }).catchError((e) => throw Exception(e)) as bool;
  }

  @override
  Future<bool> clearSession() async {
    return await _doWork((pref) {
      return pref.clear();
    }).catchError((e) => throw Exception(e)) as bool;
  }

  @override
  Future<void> reload() {
    return _doWork((pref) {
      pref.reload();
    }).catchError((e) => throw Exception(e));
  }

  @override
  Future<dynamic> save(String key, value) {
    return _doWork((pref) {
      try {
        if (value is String) {
          return pref.setString(key, value);
        } else if (value is int) {
          return pref.setInt(key, value);
        } else if (value is bool) {
          return pref.setBool(key, value);
        } else if (value is double) {
          return pref.setDouble(key, value);
        } else if (value is List<String>) {
          return pref.setStringList(key, value);
        } else {
          throw Exception('Type ${value.runtimeType} is undefined');
        }
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        throw Exception('Failed to save $key: ${value.toString()}');
      }
    }).catchError((e) => throw Exception(e));
  }
}
