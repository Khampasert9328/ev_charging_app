import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/page/managemantstation/managementstation.dart';
import 'package:ev_charging/page/settings/settings.dart';
import 'package:ev_charging/page/stationall/stationall.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
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
  String? role;
  @override
  void initState() {
    PreFer().getRole().then((value) {
      setState(() {
        role = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          role == 'admin'
              ? ListTile(
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
                    translation(context).managementstation,
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                )
              : SizedBox(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: SvgPicture.asset("images/icon_location.svg"),
            title: Text(
              translation(context).maps,
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
              translation(context).chargestation,
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
              translation(context).setting,
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset("images/icon_info.svg"),
            title: Text(
              translation(context).about,
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
