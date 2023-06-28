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

class AddStationService{
  static Future addStationService(context) async {
    final modelContainer = Provider.of<InfoContainerProvider>(context, listen: false);
    final modelLocation = Provider.of<InfoLocationProvider>(context, listen: false);
    final modelCompany = Provider.of<InfoCompanyProvider>(context, listen: false);
    String? token = await PreFer().getToken();
    String? province = modelLocation.province!.replaceAll("(", "").replaceAll(")", "");
    String? city = modelLocation.city!.replaceAll("(", "").replaceAll(")", "");
    String? village = modelLocation.village!.replaceAll("(", "").replaceAll(")", "");

    List<Map<String, dynamic>> container = [];
    List<Map<String, dynamic>> facility = [];


      for (int i = 0; i < modelContainer.containersList.length; i++) {
        container.add(
            {
              "count": "ຕູ້ທີ${i + 1}",
              "brand": modelContainer.brand[i].text,
              "generation": modelContainer.generation[i].text,
              "model": modelContainer.model[i].text,
              "type_charge" : [
                for(var j in modelContainer.containersList[i].typeChargingList) {
                  "type_charging" : j.index == i ? j.typeCharging : ""
                  }
              ],
            });
      }

      for(var i in modelLocation.listplace){
          facility.add({
            "facilitie" : i
          });
      }

      String payload = jsonEncode({
        "name": modelCompany.namcompany,
        "imagecpn": modelCompany.imageUrl,
        "amount": modelContainer.containersList.length,
        "pictureplace": modelContainer.imageUrl,
        "province": province,
        "district": city,
        "village": village,
        "nameplace": modelLocation.nameplace,
        "lat_location": modelLocation.latitude,
        "lng_lacation": modelLocation.longtitude,
        "constainner": container,
        "facilities": facility,
        // [
        //   {
        //     "facilitie": "cafe",
        //     "_id": "64893be4053a02656d9837b0"
        //   },
        //   {
        //     "facilitie": "minibig C",
        //     "_id": "64893be4053a02656d9837b1"
        //   },
        //   {
        //     "facilitie": "ຮ້ານ ອາຫານຈີນ",
        //     "_id": "64893be4053a02656d9837b1"
        //   },
        //   {
        //     "facilitie": "ຮ້ານອາຫານກິນດື່ມ",
        //     "_id": "64893be4053a02656d9837b1"
        //   },
        //   {
        //     "facilitie": "ຮ້ານອາຫານຫວຽດ",
        //     "_id": "64893be4053a02656d9837b1"
        //   },
        //   {
        //     "facilitie": "ຮ້ານອາຫານຝຣັ່ງ",
        //     "_id": "64893be4053a02656d9837b1"
        //   }
        // ]
      });

      showDialog(context: context, builder: (_){
        return const LoadingDialog(title: 'ກຳລັງດຳເນີນການ',);
      });

      final res = await http.post(Uri.parse(AppDomain.addStation),
      headers: {
          "accept":"text/plain",
          "Authorization" : "Bearer $token",
          "Content-Type" : "application/json",
        },
        body: payload,
      );
      if(res.statusCode == 201){
        Navigator.pop(context);
        showDialog(context: context, builder: (_){
          return DialogSucces(title: 'ເພີ່ມຂໍ້ມູນສຳເລັດ', onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ManagemaentStation()));
            // Navigator.pop(context);
          });
        });
      }else{
        Navigator.pop(context);
        showDialog(context: context, builder: (context){
          return DialogError(title: 'ເກີດຂໍ້ຜິດພາດ', onTap: (){
            Navigator.pop(context);
          });
        });
      }
  }}
