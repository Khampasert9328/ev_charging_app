
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetLangugesProvider extends ChangeNotifier {
  final lang ="lang";
  String? langs = "en";
  String? get langUA => langs;

  Future<String?> setLangugePreference(String val)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(lang, val);
    notifyListeners();

    return lang;
    

  }

  changeLanguge(val){
    setLangugePreference(val);
    notifyListeners();
  }
}