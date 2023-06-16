import 'package:ev_charging/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            width: 100.w,
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
              height: 30.h,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: const Text(
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
