import 'package:shared_preferences/shared_preferences.dart';

class PreFer {
  SharedPreferences? preferences;
  String checklogin = '';
  String saveToken = 'token';
  String role = "role";

  Future<void> setToken(String val) async {
    preferences = await SharedPreferences.getInstance();
    await preferences!.setString(saveToken, val);
  }

  Future<String?> getToken() async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.getString(saveToken);
  }

  Future<void> cleartoken() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.clear();
  }

  Future<void> clearrole() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.clear();
  }

  Future<void> setRole(String val) async {
    preferences = await SharedPreferences.getInstance();
    await preferences!.setString(role, val);
  }

  Future<String?> getRole() async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.getString(role);
  }
}
