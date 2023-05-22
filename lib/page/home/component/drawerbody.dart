import 'package:ev_charging/page/managemantstation/managementstation.dart';
import 'package:ev_charging/page/settings/settings.dart';
import 'package:ev_charging/page/stationall/stationall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EVDrawerBody extends StatefulWidget {
  final String? token;
  const EVDrawerBody({super.key, required this.token});

  @override
  State<EVDrawerBody> createState() => _EVDrawerBodyState();
}

class _EVDrawerBodyState extends State<EVDrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManagemaentStation(),
                      ),
                    );
                  },
                  leading: SvgPicture.asset("images/icon_management_info.svg"),
                  title: Text(
                    "ຈັດການຂໍ້ມູນສະຖານີ",
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset("images/icon_location.svg"),
            title: Text(
              "ແຜນທີ່",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const StationAll(),
                ),
              );
            },
            leading: SvgPicture.asset("images/icon_station.svg"),
            title: Text(
              "ສະຖານີສາກທັງໝົດ",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsScreen(),
                ),
              );
            },
            leading: SvgPicture.asset("images/icon _setting.svg"),
            title: Text(
              "ຕັ້ງຄ່າ",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset("images/icon_info.svg"),
            title: Text(
              "ກ່ຽວກັບ",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
