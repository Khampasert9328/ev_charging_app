import 'dart:convert';
import 'package:ev_charging/constant/domain.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:ev_charging/widget/dialog/dialogerror.dart';
import 'package:ev_charging/widget/dialog/dialogsucces.dart';
import 'package:ev_charging/widget/dialog/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddStationService{
  static Future addStationService(context) async{
    final model = Provider.of<InfoContainerProvider>(context, listen: false);
    String? token = await PreFer().getToken();

    List<Map<String, dynamic>> container = [];
    List<Map<String, dynamic>> chargeType = [];
    for(var i in model.chargeType){
      chargeType.add({
        "type_charging": i,
      });
    }

    for(int i = 0; i<model.count; i++){
      container.add(
        {
          "count": "ຕູ້ທີ${i+1}",
          "brand": model.brand[i].text,
          "generation": model.generation[i].text,
          "model": model.model[i].text,
          "type_charge": chargeType
        },
      );
    }
    void printLongString(String text) {
      final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern.allMatches(text).forEach((RegExpMatch match) =>   print(match.group(0)));
    }

    String payload = jsonEncode({
      "name": "Tah3",
      "imagecpn": "https://ad-bucket.sgp1.digitaloceanspaces.com/saveimagecharg/vpk8ae1686974891696.jpg",
      "amount": 3,
      "pictureplace": "https://ad-bucket.sgp1.digitaloceanspaces.com/saveimagecharg/l5qor1686975024299.jpeg",
      "province": "ສະຫວັນນະເຂດ",
      "district": "ໍຊົນບູລີ",
      "village": "ສອງຄອນ",
      "nameplace": "ວິທະຍາໄລສະຫວັນນະເຂດ",
      "lat_location": 17000000,
      "lng_lacation": 1600000000,
      "constainner": container,
      "facilities": [
        {
          "facilitie": "cafe",
          "_id": "64893be4053a02656d9837b0"
        },
        {
          "facilitie": "minibig C",
          "_id": "64893be4053a02656d9837b1"
        },
        {
          "facilitie": "ຮ້ານ ອາຫານຈີນ",
          "_id": "64893be4053a02656d9837b1"
        },
        {
          "facilitie": "ຮ້ານອາຫານກິນດື່ມ",
          "_id": "64893be4053a02656d9837b1"
        },
        {
          "facilitie": "ຮ້ານອາຫານຫວຽດ",
          "_id": "64893be4053a02656d9837b1"
        },
        {
          "facilitie": "ຮ້ານອາຫານຝຣັ່ງ",
          "_id": "64893be4053a02656d9837b1"
        }
      ]
    });

    printLongString(payload.toString());

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
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AllItem()));
          Navigator.pop(context);

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
  }
}