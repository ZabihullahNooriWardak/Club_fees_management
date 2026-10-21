import 'package:shared_preferences/shared_preferences.dart';

class AppCacheRepository {
  final SharedPreferencesAsync _pref;

  AppCacheRepository(SharedPreferencesAsync pref) : _pref = pref;

  Future<void> saveString(String key, String value) async {
    await _pref.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return await _pref.getString(key);
  }
}
