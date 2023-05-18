import 'package:ev_charging/busines%20logic/auth_provider.dart';
import 'package:ev_charging/constant/color.dart';

import 'package:ev_charging/page/home/component/buttonlogout.dart';
import 'package:ev_charging/page/home/component/drawerbody.dart';
import 'package:ev_charging/page/home/component/drawerheader.dart';
import 'package:ev_charging/page/home/component/showmaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeMaps extends StatefulWidget {
  const HomeMaps({super.key});

  @override
  State<HomeMaps> createState() => _HomeMapsState();
}

class _HomeMapsState extends State<HomeMaps> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  bool? check;

  String? token;
  @override
  void initState() {
    if (token == null) {
      Provider.of<AuthProvider>(context, listen: false).checklogin();
      token = context.read<AuthProvider>().token;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 21,
              right: 22,
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                token == null
                    ? EVDrawerHeader()
                    : CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 50,
                        child: const Icon(
                          Icons.person_4_outlined,
                          color: EV_Colors.whitecolor,
                          size: 70,
                        ),
                      ),
                SizedBox(
                  height: 10.h,
                ),
                token == null
                    ? SizedBox()
                    : Text(
                        "ສະເພາະຜູ້ຮັບຜິດຊອບເທົ່ານັ້ນ",
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                const Divider(),
                 EVDrawerBody(token: token,),
                token == null ? SizedBox() : ButtonLogOut()
              ],
            ),
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            const ShowMaps(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 35.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: EV_Colors.yellowbtncolor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      print("token====$token");

                      _globalKey.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: EV_Colors.whitecolor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
