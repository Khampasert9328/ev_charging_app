import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/managementstation.dart';
import 'package:ev_charging/page/settings/settings.dart';
import 'package:ev_charging/page/stationall/stationall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class EVDrawerBody extends StatelessWidget {
  const EVDrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ManagemaentStation()));
            },
            leading: const Icon(
              IconlyBold.location,
              color: EV_Colors.yellowbtncolor,
            ),
            title: Text(
              "ຈັດການຂໍ້ມູນສະຖານີ",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              IconlyBold.location,
              color: EV_Colors.yellowbtncolor,
            ),
            title: Text(
              "ແຜນທີ່",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          ListTile(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (_)=>StationAll()));
            },
            leading: const Icon(
              IconlyBold.location,
              color: EV_Colors.yellowbtncolor,
            ),
            title: Text(
              "ສະຖານີສາກທັງໝົດ",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingsScreen()));
            },
            leading: const Icon(
              IconlyBold.setting,
              color: EV_Colors.yellowbtncolor,
            ),
            title: Text(
              "ຕັ້ງຄ່າ",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              IconlyBold.info_square,
              color: EV_Colors.yellowbtncolor,
            ),
            title: Text(
              "ກ່ຽວກັບ",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),

          Divider(),
          
        ],
      ),
    );
  }
}
