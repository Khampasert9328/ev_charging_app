// ignore_for_file: must_be_immutable

import 'package:ev_charging/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DialogSucces extends StatelessWidget {
  final String title;
  VoidCallback onTap;

   DialogSucces({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "images/success.gif",
            width: 200.w,
            height: 100.h,
          ),
          Text(title),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap:onTap,
            child: Container(
              alignment: Alignment.center,
              height: 40.h,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "ຕົກລົງ",
                style: TextStyle(color: EV_Colors.whitecolor, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
