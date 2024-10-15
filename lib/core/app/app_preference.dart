import 'dart:convert';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_dependency.dart';

const String prefsKeyLang = "prefsKeyLang";
const String prefsKeyIsUserLoggedIn = "prefsKeyIsUserLoggedIn";
const String prefsKeyUserLanguage = "prefsKeyUserLanguage";
const String prefsKeyUserLanguageName = "prefsKeyUserLanguageName";
const String prefsKeyUserCountryAbbreviation =
    "prefsKeyUserCountryAbbreviation";
const String prefsKeyAppDarkTheme = "prefsKeyAppDarkTheme";
const String prefsKeyUserInfo = "prefsKeyUserInfo";
const String prefsKeyUserToken = "prefsKeyUserToken";

@injectable
class AppPreferences {
  final _sharedPreferences = instance<SharedPreferences>();

  /// set preferences data start here ///

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(prefsKeyUserToken, token);
  }

  // Future<void> saveUserData(LoginResponse userData) async {
  //   _sharedPreferences.setString(prefsKeyUserInfo, json.encode(userData));
  //   setIsUserLoggedIn();
  // }

  Future<void> setLanguage(String? language) async {
    _sharedPreferences.setString(prefsKeyUserLanguage, language ?? 'de');
  }

  Future<void> setLanguageName(String? languageName) async {
    _sharedPreferences.setString(
        prefsKeyUserLanguageName, languageName ?? 'German');
  }

  Future<void> setIsAppDarkTheme(bool isDark) async {
    _sharedPreferences.setBool(prefsKeyAppDarkTheme, isDark);
  }

  Future<void> removeUserData() async {
    _sharedPreferences.remove(prefsKeyUserInfo);
    _sharedPreferences.remove(prefsKeyUserToken);
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  /// set preferences data end here ///

  /// get preferences data start here ///

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(prefsKeyUserToken) ?? "";
  }

  String getLanguage() {
    return _sharedPreferences.getString(prefsKeyUserLanguage) ?? 'de';
  }

  bool getIsAppDarkTheme() {
    return _sharedPreferences.getBool(prefsKeyAppDarkTheme) ?? false;
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    await removeUserData();
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  /// get preferences data end here ///
}
