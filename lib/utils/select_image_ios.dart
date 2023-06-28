import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectImageIOs{
  Future<void> selectImage(context, VoidCallback openImage, VoidCallback openCamera) async{
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
                child: const Text('ຍົກເລີກ', style: TextStyle(color: Colors.red)),
              ),
            );
          });
  }
}