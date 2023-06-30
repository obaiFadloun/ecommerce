import 'package:shared_preferences/shared_preferences.dart';


const kIsLoggedIn = "kIsLoggedIn";

class CacheManager {
  SharedPreferences preferences;

  static CacheManager _instance;

  static Future<CacheManager> getInstance() async {
    if (_instance == null) {
      _instance = CacheManager._();
      await _instance.initSharedPrefs();
    }
    return _instance;
  }

  CacheManager._();

  Future initSharedPrefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  bool isLoggedIn() {
    return preferences.getBool(kIsLoggedIn) ?? false;
  }
  Future login() async {
    await preferences.setBool(kIsLoggedIn, true);
  }

  Future logout() async {
    await preferences.setBool(kIsLoggedIn, false);
  }
}
