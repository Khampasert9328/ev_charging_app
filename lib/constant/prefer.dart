import 'package:shared_preferences/shared_preferences.dart';

class PreFer {
  SharedPreferences? preferences;
  String checklogin = '';
  String saveToken = 'token';
  String role = "role";
  String lat = 'lat';
  String long = 'long';
  String startapp = "start";

  /// set and get first time use this app
  Future<void> firsTimeApp(String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(startapp, val);
  }

  Future<String?> getFirstTimeApp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(startapp);
  }

  Future<void> setLat(num val) async {
    preferences = await SharedPreferences.getInstance();
    await preferences!.setString(lat, val.toString());
  }

  Future getLat() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.getDouble(lat);
  }

  Future<void> setLong(num val) async {
    preferences = await SharedPreferences.getInstance();
    await preferences!.setString(long, val.toString());
  }

  Future getLong() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.getDouble(long);
  }

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
    await preferences!.clear();
  }

  Future<void> clearrole() async {
    preferences = await SharedPreferences.getInstance();
    await preferences!.clear();
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
