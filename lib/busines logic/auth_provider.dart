import 'package:ev_charging/constant/prefer.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  String? _token;
  String? _role;
  String? get token => _token;
  String? get role => _role;

  Future<void> checklogin() async {
    _token = await PreFer().getToken();
    _role = await PreFer().getRole();
    notifyListeners();
  }

  Future<void> clearalltoken() async {
    _token = null;
    _role = null;
    notifyListeners();
  }
}
