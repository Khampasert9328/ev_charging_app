import 'package:shared_preferences/shared_preferences.dart';

class PreFer {
  SharedPreferences? preferences;
  String checklogin = '';

  Future<bool> setChecklogin(bool val) async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.setBool(checklogin, val);
  }

  Future<bool?> getChecklogin() async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.getBool(checklogin);
  }
}
