import 'package:ev_charging/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget({super.key, required this.onTap});
  VoidCallback onTap;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: EV_Colors.greencolor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        "ເຂົ້າສູ່ລະບົບ",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,color: EV_Colors.whitecolor
        ),
      ),
    );
  }
}
