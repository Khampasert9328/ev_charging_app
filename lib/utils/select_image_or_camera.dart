import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectImage{
  Future<void> selectImage(context, VoidCallback openImage, VoidCallback openCamera) async{
    if(Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (cnt) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  onPressed: openCamera,
                  child: const Text(
                    "ເປີດກ້ອງ",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: openImage,
                  child: const Text(
                    "ບ່ອນເກັບຮູບພາບ",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                    'ຍົກເລີກ', style: TextStyle(color: Colors.red)),
              ),
            );
          });
    }else if(Platform.isAndroid){
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            // <-- SEE HERE
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              )),
          builder: (BuildContext cont) {
            return SizedBox(
              height: 150.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.camera),
                      title: const Text(
                        'ເປີດກ້ອງຖ່າຍຮູບ',
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: openCamera,
                    ),
                    ListTile(
                      leading: const Icon(Icons.image),
                      title: const Text(
                        'ບ່ອນເກັບຮູບ',
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: openImage,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    }
}