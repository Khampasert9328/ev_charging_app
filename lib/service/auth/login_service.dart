// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:ev_charging/constant/domain.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/models/auth/ForgotPassword.dart';
import 'package:ev_charging/models/auth/login_models.dart';
import 'package:ev_charging/page/home/homemaps.dart';
import 'package:ev_charging/page/register/login.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
import 'package:ev_charging/widget/dialog/dialogerror.dart';
import 'package:ev_charging/widget/dialog/dialogsucces.dart';
import 'package:ev_charging/widget/dialog/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

Future<void> loginservice(String email, String password, context) async {
  try {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return LoadingDialog(title: translation(context).loading);
        });
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
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeMaps()), (route) => false);
    } else if (respones.statusCode == 400) {
      Navigator.pop(context);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) {
            return DialogError(
              title: "ອີເມລ ແລະ ລະຫັດຜ່ານ\nບໍ່ຖືກຕ້ອງກາລຸນາລອງໃໝ່ອີກຄັ້ງ",
              onTap: () {
                Navigator.pop(context);
              },
            );
          });
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> forgotpassword(String email, context) async {
  try {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return LoadingDialog(title: translation(context).sendemail);
        });
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
      Navigator.pop(context);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) {
            return DialogSucces(
              title: translation(context).checkemail,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
            );
          });
      var map = Map<String, dynamic>.from(jsonDecode(response.body));
      ForgotPasswordModels.fromJson(map);
    } else if (response.statusCode == 400) {
      Navigator.pop(context);
      showDialog(
      barrierDismissible: false,
          context: context,
          builder: (_) {
            return DialogError(
              title: "ອີເມລຂອງທ່ານບໍ່ມີໃນລະບົບ",
              onTap: () {
                Navigator.pop(context);
              },
            );
          });
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> changpassword(context, String password) async {
  try {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (_) {
          return LoadingDialog(title: translation(context).changepassword);
        });

    String? token = await PreFer().getToken();
    Map<String, dynamic> playload = Jwt.parseJwt(token!);
    String? id = playload["id"];
    String url = "${AppDomain.changepassword}/$id";
    Object body = jsonEncode({
      "password": password,
    });
    final response = await http.patch(
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
      Navigator.pop(context);
      showDialog(
      barrierDismissible: false,
          context: context,
          builder: (_) {
            return DialogSucces(title: "ປ່ຽນລະຫັດຜ່ານສຳເລັດແລ້ວ",onTap: () {
              
            },);
          });
      var map = Map<String, dynamic>.from(jsonDecode(response.body));
      ForgotPasswordModels.fromJson(map);
    } else if (response.statusCode == 400) {
      Navigator.pop(context);
      showDialog(
      barrierDismissible: false,
          context: context,
          builder: (_) {
            return DialogError(
              title: "ບໍ່ສາມາດປ່ຽນລະຫັດຜ່ານ...",
              onTap: () {
                Navigator.pop(context);
              },
            );
          });
    }
  } catch (e) {
    Navigator.pop(context);
    final snackbar = SnackBar(
      content: AwesomeSnackbarContent(
        title: "ແຈ້ງເຕືອນ",
        message: "ກາລຸນາເຊື່ອມຕໍ່ອິນເຕີເນັດ",
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
