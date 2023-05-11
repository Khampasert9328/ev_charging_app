import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/register/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EVDrawerHeader extends StatelessWidget {
  const EVDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 88),
        height: 46.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: EV_Colors.yellowbtncolor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          "ເຂົ້າສູ່ລະບົບ",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: EV_Colors.whitecolor,
          ),
        ),
      ),
    );
  }
}
