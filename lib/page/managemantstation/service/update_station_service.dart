import 'dart:convert';

import 'package:ev_charging/page/managemantstation/provider/update_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constant/domain.dart';
import '../../../constant/prefer.dart';
import '../../../widget/dialog/dialogerror.dart';
import '../../../widget/dialog/loading.dart';
import '../../../widget/dialog/loadingscreen.dart';
import '../managementstation.dart';
import '../models/get_info_charg_models.dart';

class UpdateStationService{
  static Future updateStationService(context, String id, DataGetInfoCharg? data) async{
    final model = Provider.of<UpdateInfoProvider>(context, listen: false);
    String? token = await PreFer().getToken();
    List<Map<String, dynamic>> facility = [];
    List<Map<String, dynamic>> oldContainer = [];

    for(var i in model.facilities){
      facility.add({
        "facilitie" : i.text
      });
    }

    // for(int i =0; i< data!.constainner.length; i++){
    //   oldContainer.add({
    //     "count": "ຕູ້ທີ${i+1}",
    //     "brand": data.constainner[i].brand,
    //     "generation": data.constainner[i].generation,
    //     "model": data.constainner[i].model,
    //     "type_charge": [
    //       for(var j in data.constainner[i].typeCharge){
    //         "type_charging" : j.typeCharging
    //       }
    //     ]
    //   });
    // }

    for (int i = 0; i < model.containersList.length; i++) {
      oldContainer.add(
          {
            "count": "ຕູ້ທີ${i + 1}",
            "brand": model.brand[i].text,
            "generation": model.gen[i].text,
            "model": model.model[i].text,
            "type_charge" : [
              for(var j in model.containersList[i].typeChargingList) {
                  "type_charging" : j.index == i ? j.typeCharging : ""
              }
            ],
          });
    }


    String payload = jsonEncode({
        "name": model.nameCpn.text,
        "imagecpn": model.imageCpn,
        "amount": model.containersList.length,
        "pictureplace": model.imageStation,
        "province": data.province,
        "district": data.district,
        "village": data.village,
        "nameplace": model.namePlace.text,
        "lat_location": data.latLocation,
        "lng_lacation": data.lngLacation,
        "constainner": oldContainer,
        "facilities": facility
    });

    showDialog(context: context, builder: (_){
      return const LoadingDialog(title: 'ກຳລັງດຳເນີນການ',);
    });

    final res = await http.put(Uri.parse(AppDomain.updateStation + id),
      headers: {
        "accept":"text/plain",
        "Authorization" : "Bearer $token",
        "Content-Type" : "application/json",
      },
      body: payload,
    );
    if(res.statusCode == 200){
      Navigator.pop(context);
      EVDialog().showDialogSuccess(
          context, "ແຈ້ງເຕືອນ", "ແກ້ໄຂຂໍ້ມູນສຳເລັດແລ້ວ", () {
            model.clearForm();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ManagemaentStation()));

      });
<<<<<<< HEAD
=======
     
>>>>>>> xaiy_ev
    }else{
      print(oldContainer);
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return DialogError(title: 'ເກີດຂໍ້ຜິດພາດ', onTap: (){
          Navigator.pop(context);
        });
      });
    }  }
}