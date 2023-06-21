import 'dart:convert';
import 'package:ev_charging/constant/domain.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/page/managemantstation/managementstation.dart';
import 'package:ev_charging/page/managemantstation/provider/info_company_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/infon_location_provider.dart';
import 'package:ev_charging/widget/dialog/dialogerror.dart';
import 'package:ev_charging/widget/dialog/dialogsucces.dart';
import 'package:ev_charging/widget/dialog/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddStationService {
  static Future addStationService(context) async {
    final model = Provider.of<InfoContainerProvider>(context, listen: false);
    final modellocation = Provider.of<InfoLocationProvider>(context, listen: false);
    final modelcompany = Provider.of<InfoCompanyProvider>(context, listen: false);
    String? token = await PreFer().getToken();
    String? province = modellocation.province!.replaceAll("(", "").replaceAll(")", "");
    String? city = modellocation.city!.replaceAll("(", "").replaceAll(")", "");
    String? village = modellocation.village!.replaceAll("(", "").replaceAll(")", "");

    List<Map<String, dynamic>> container = [];
    List<Map<String, dynamic>> chargeType = [];
    List<Map<String, dynamic>> facilities = [];
    for (var i in modellocation.listplace) {
      facilities.add({"facilitie": i});
    }
    for (var i in model.chargeType) {
      chargeType.add({
        "type_charging": i,
      });
    }

    for (int i = 0; i < model.count; i++) {
      container.add(
        {
          "count": "ຕູ້ທີ${i + 1}",
          "brand": model.brand[i].text,
          "generation": model.generation[i].text,
          "model": model.model[i].text,
          "type_charge": chargeType
        },
      );
    }
    void printLongString(String text) {
      final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern.allMatches(text).forEach((RegExpMatch match) => print(match.group(0)));
    }

    String payload = jsonEncode({
      "name": "${modelcompany.namcompany}",
      "imagecpn": "${modelcompany.imageUrl}",
      "amount": model.count,
      "pictureplace": "${model.imageUrl}",
      "province": province,
      "district": city,
      "village": village,
      "nameplace": modellocation.nameplace,
      "lat_location": 17000000,
      "lng_lacation": 1600000000,
      "constainner": container,
      "facilities": facilities,
    });

    printLongString(payload.toString());

    showDialog(
        context: context,
        builder: (_) {
          return const LoadingDialog(
            title: 'ກຳລັງດຳເນີນການ',
          );
        });

    final res = await http.post(
      Uri.parse(AppDomain.addStation),
      headers: {
        "accept": "text/plain",
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: payload,
    );
    if (res.statusCode == 201) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (_) {
            return DialogSucces(
                title: 'ເພີ່ມຂໍ້ມູນສຳເລັດ',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const ManagemaentStation()));
                  model.clearContainner();
                  modelcompany.clearInfoCompany();
                  modellocation.clearInfolocation();
                });
          });
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return DialogError(
                title: 'ເກີດຂໍ້ຜິດພາດ',
                onTap: () {
                  Navigator.pop(context);
                });
          });
    }
  }
}
