import 'dart:convert';

import 'package:ev_charging/constant/domain.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/models/auth/login_models.dart';
import 'package:ev_charging/page/home/homemaps.dart';
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
    }else if(respones.statusCode==400){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: SnackBar(
      content:  Text("ແຈ້ງເຕືອນ"),
      action: SnackBarAction(
        label: "ກາລຸນາໃສ່ອີເມລ ແລະ ລະຫັດຜ່ານໃຫ້ຖືກຕ້ອງ",
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    )));
    }
  } catch (e) {
    rethrow;
  }
}
