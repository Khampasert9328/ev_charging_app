import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ev_charging/constant/domain.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/page/managemantstation/models/image_models.dart';
import 'package:ev_charging/widget/dialog/dialogerror.dart';
import 'package:ev_charging/widget/dialog/dialogsucces.dart';
import 'package:ev_charging/widget/dialog/loadingscreen.dart';
import 'package:flutter/material.dart';

class AddImage {
  static Future addimage(File? image, context) async {
    String? token = await PreFer().getToken();
    showDialog(
        context: context,
        builder: (_) {
          return LoadingDialog(title: "ກຳລັງອັບໂຫລດຮູບພາບ");
        });

    var imagefile = image!.path;
    var imageName = image.path.split('/').last;

    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        imagefile,
        filename: imageName,
      ),
    });
    var response = await Dio().post(AppDomain.uploadimage,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
            "Authorization": "Bearer $token",
          },
        ));
    if (response.statusCode == 200) {
      Navigator.pop(context);
      var map = Map<String, dynamic>.from(jsonDecode(jsonEncode(response.data)));
      UploadimageModels model = UploadimageModels.fromJson(map);
      showDialog(
          context: context,
          builder: (_) {
            return DialogSucces(
              title: "ອັບໂຫລດຮູບພາບສຳເລັດ",
              onTap: () {
                Navigator.pop(context);
              },
            );
          });
      return model;
    } else if (response.statusCode == 401) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (_) {
            return DialogError(
                title: "ໄຟຮູບພາບໃຫຍ່ເກີນໄປ",
                onTap: () {
                  Navigator.pop(context);
                });
          });
    }
  }
}
