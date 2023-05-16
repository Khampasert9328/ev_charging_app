import 'package:shared_preferences/shared_preferences.dart';

class PreFer {
  SharedPreferences? preferences;
  String checklogin = '';
  String saveToken = 'token';
  String role = "role";

  

  Future<String?> setToken(String val) async {
    preferences = await SharedPreferences.getInstance();
   await preferences!.setString(saveToken, val);
  }

  Future<String?> getToken() async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.getString(saveToken);
  }

  Future<String?> setRole(String val) async {
    preferences = await SharedPreferences.getInstance();
   await preferences!.setString(role, val);
  }

  Future<String?> getRole() async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.getString(role);
  }
}