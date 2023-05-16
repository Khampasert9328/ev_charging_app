// ignore_for_file: use_build_context_synchronously

import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/models/auth/login_models.dart';
import 'package:ev_charging/service/auth/login_service.dart';
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

  // Future<void> loginprovider(
  //     String email, String password, context) async {
  //   _isloading = true;
  //  loginservice(email, password, context);
  //   _isloading = false;
  //   notifyListeners();
  // }

  Future<void> checklogin() async {
    _token = await PreFer().getToken();
    _role = await PreFer().getRole();
    notifyListeners();
  }
}
