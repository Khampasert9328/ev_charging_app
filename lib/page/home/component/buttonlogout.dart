import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonLogOut extends StatefulWidget {
  const ButtonLogOut({super.key});

  @override
  State<ButtonLogOut> createState() => _ButtonLogOutState();
}

class _ButtonLogOutState extends State<ButtonLogOut> {
  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    //final clear = context.read<AuthProvider>();
    return GestureDetector(
      onTap: () async {
        SharedPreferences pre = await SharedPreferences.getInstance();
        await pre.clear().then((value) async {
          setState(() {
            Navigator.pop(context);
          });
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 46.h,
        width: double.infinity,
        decoration: BoxDecoration(color: EV_Colors.redbtncolor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "ອອກຈາກລະບົບ",
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
