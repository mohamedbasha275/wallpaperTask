import 'package:shared_preferences/shared_preferences.dart';

const String isUserLoggedKey = "isUserLoggedKey";
const String authTokenKey = "authTokenKey";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // login
  Future<void> setIsLogged() async {
    _sharedPreferences.setBool(isUserLoggedKey, true);
  }
  // isLogged
  Future<bool> isLogged() async {
    return _sharedPreferences.getBool(isUserLoggedKey) ?? false;
  }
  // logout
  Future<void> logout() async {
    _sharedPreferences.remove(authTokenKey);
  }
}
