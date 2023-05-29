import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/models/auth/login_models.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  LoginModels? _models;
  LoginModels? get models => _models;
  bool _isloading = false;
  bool get loading => _isloading;

  String? _token;
  String? _role;
  String? get token => _token;
  String? get role => _role;

  Future<void> checklogin() async {
    _token = await PreFer().getToken();
    _role = await PreFer().getRole();
    notifyListeners();
  }

  Future<void> clearalltoken(String? val) async {
    _token = val;
    _role = val;
    notifyListeners();
  }
}
