import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  static SharedPreferences? _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  //sets
  static Future<bool> setBool(String key, bool value) async =>
      await _prefs!.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _prefs!.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _prefs!.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _prefs!.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _prefs!.setStringList(key, value);

  static saveStateLogin(String username, String Password, bool remember) async {
    await _prefs!.setString("password", Password);
    await _prefs!.setString("username", username);
    await _prefs!.setBool("remember", remember);
  }

  //gets
  static bool? getBool(String key) => _prefs?.getBool(key);

  static double? getDouble(String key) => _prefs?.getDouble(key);

  static int? getInt(String key) => _prefs?.getInt(key);

  static String? getString(String key) => _prefs?.getString(key);

  static List<String>? getStringList(String key) => _prefs?.getStringList(key);

  static String? readUsername() => _prefs?.getString("username");
  static String? readPassword() => _prefs?.getString("password");

  //deletes..
  static Future<bool> remove(String key) async => await _prefs!.remove(key);

  static Future<bool> clear() async => await _prefs!.clear();

  static removeUserPass() async {
    await _prefs!.remove("username");
    await _prefs!.remove("password");
    await _prefs!.remove("remember");
  }

  // readObject(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return json.decode(prefs.getString(key)!) ?? null;
  // }

  // saveObject(String key, value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, json.encode(value));
  // }

  // removeObject(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove(key);
  // }

  // saveUserPass(String username, String Password) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString("username", username);
  //   prefs.setString("password", Password);
  // }

  // void readUsername() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final value = prefs.getString("username") ?? "";
  //   return value;
  // }

  // readPassword() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("password") ?? "";
  // }

  // removeUserPass() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove("username");
  //   prefs.remove("password");
  // }
}
