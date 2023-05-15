import 'dart:convert';

import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/models/auth/login_models.dart';
import 'package:http/http.dart' as http;

Future<LoginModels?> loginservice(String email, String password) async {
  try {
    var url = "http://172.16.2.196:3000/users/login";
    // String body = jsonEncode(
    //   {
    //     "email": email,
    //     "password": password,
    //   },
    // );
    var respones = await http.post(Uri.parse(url),
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
        headers: {
          "accept": "text/plain",
          "Content-Type": "application/json",
        });
    if (respones.statusCode == 200) {
      var map = Map<String, dynamic>.from(jsonDecode(respones.body));
    LoginModels loginData = LoginModels.fromJson(map);

    print("respones====${loginData.accessToken}");

     await PreFer().setToken(loginData.accessToken!);
     await PreFer().setRole(loginData.expiresToken!.role!);
      return loginModelsFromJson(respones.body);
    }
  } catch (e) {
    rethrow;
  }
}
