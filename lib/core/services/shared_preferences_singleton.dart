
import 'package:shared_preferences/shared_preferences.dart';


class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  // static String getCurrentLanguage() {
  //   return _instance.getString (kAppLanguage) ?? _getDeviceLanguage();
  // }

  // static Future<void> saveLanguage(String langCode) async {
  //   await _instance.setString(kAppLanguage, langCode);
  // }

  // static String _getDeviceLanguage() {
  //   return PlatformDispatcher.instance.locale.languageCode;
  // }

  //   static Future<bool> setLastCity(String key, String value) async {
  //     return await _instance.setString(key, value);
  // }

  // static String getString(String key) {
  //   return _instance.getString(key) ?? 'Cairo';
  // }
}
