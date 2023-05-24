import 'dart:convert';

import 'package:ev_charging/constant/domain.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/models/auth/ForgotPassword.dart';
import 'package:ev_charging/models/auth/login_models.dart';
import 'package:ev_charging/page/home/homemaps.dart';
import 'package:ev_charging/page/register/login.dart';
import 'package:ev_charging/widget/dialog/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> loginservice(String email, String password, context) async {
  try {
    EVDialog().showDialogLoading(context, "ກຳລັງເຂົ້າສູ່ລະບົບ...");
    String url = AppDomain.login;
    Object body = jsonEncode(
      {
        "email": email,
        "password": password,
      },
    );
    final respones = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "accept": "text/plain",
        "Content-Type": "application/json",
      },
    );
    if (respones.statusCode == 200) {
      Navigator.pop(context);
      var map = Map<String, dynamic>.from(jsonDecode(respones.body));
      LoginModels loginData = LoginModels.fromJson(map);
      await PreFer().setToken(loginData.accessToken!);
      await PreFer().setRole(loginData.expiresToken!.role!);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeMaps()),
          (route) => false);
    } else if (respones.statusCode == 400) {}
  } catch (e) {
    rethrow;
  }
}

Future<void> forgotpassword(String email, context) async {
  try {
      EVDialog().showDialogSuccess(
        context,
        "ແຈ້ງເຕືອນ",
        "ກາລຸນາກວດສອບອີເມຂອງທ່ານ",
        () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
        },
      );
    String url = AppDomain.forgotpassword;
    Object body = jsonEncode(
      {
        "email": email,
      },
    );

    final response = await http.put(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "User-Agent": "PostmanRuntime/7.32.2",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
      },
    );
    
    if (response.statusCode == 200) {
      var map = Map<String, dynamic>.from(jsonDecode(response.body));
      ForgotPasswordModels.fromJson(map);
    } else if (response.statusCode == 400) {
      Navigator.pop(context);
      EVDialog().showDiaError(context, "ບໍ່ມີອີເມລນີ້ໃນລະບົບ ກາລຸນລອງໃໝ່");
    }
  } catch (e) {
    rethrow;
  }
}
