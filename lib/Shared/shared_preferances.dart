import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'shared_obj.dart';

class SharedPref {
  static const String _userName = "userName";
  static const String _language = "language_code";
  static const String _intro = "intro";

  static Future<bool?> saveUserName({required String name}) async {
    return await SharedObj().prefs?.setString(_userName, name);
  }

  static String getUserName() {
    if(SharedObj().prefs!.containsKey(_userName))
      {
        String? userName = SharedObj().prefs?.getString(_userName);
        return userName ?? "";
      }
    else
      {
        return "";
      }

  }

  static bool isUserLogIn() {
    return SharedObj().prefs?.getString(_userName) != null;
  }

  static Future<void> logOut() async {
    await SharedObj().prefs?.remove(_userName);
  }

  static String? getCurrentLang() {
    return SharedObj().prefs?.getString(_language);
  }

  static Future<void> setCurrentLang({required String lang}) async {
    await SharedObj().prefs?.setString(_language, lang);
  }

  Future<String> getValueFromSharedPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return prefs.getString(key) ?? '';
    } else {
      return '';
    }
  }

  static Future<void> saveWatchIntro() async {
    await SharedObj().prefs?.setBool(_intro, true);
  }

  static bool isWatchIntro() {
    return SharedObj().prefs?.getBool(_intro) ?? false;
  }
}
