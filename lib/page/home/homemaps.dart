import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/page/home/component/buttonlogout.dart';
import 'package:ev_charging/page/home/component/drawerbody.dart';
import 'package:ev_charging/page/home/component/drawerheader.dart';
import 'package:ev_charging/page/home/component/showmaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMaps extends StatefulWidget {
  const HomeMaps({super.key});

  @override
  State<HomeMaps> createState() => _HomeMapsState();
}

class _HomeMapsState extends State<HomeMaps> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  bool? check;
  @override
  void initState() {
    PreFer().getChecklogin().then((value) {
      if (value==true) {
        check = value;
      }
     
      

     
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(left: 21, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                check==true?const CircleAvatar(
                  radius: 30,
                  child: Text("data")): EVDrawerHeader(),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "ສະເພາະຜູ້ຮັບຜິດຊອບເທົ່ານັ້ນ",
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                const Divider(),
                const EVDrawerBody(),

               

                check==true? ButtonLogOut():SizedBox()
                
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
