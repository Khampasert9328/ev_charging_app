import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/all_item.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManagemaentStation extends StatefulWidget {
  const ManagemaentStation({super.key});

  @override
  State<ManagemaentStation> createState() => _ManagemaentStationState();
}

class _ManagemaentStationState extends State<ManagemaentStation>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title:  Text(
            translation(context).managementstation,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
            controller: controller,
            labelColor: Colors.black,
            indicatorColor: EV_Colors.yellowbtncolor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            tabs: [
              Text(
                translation(context).allitem,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              Text(
                translation(context).filter,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const [
            AllItem(),
            Center(
              child: Text("ກຳລັງພັດທະນາ"),
            ),
          ],
        ),
      ),
    );
  }
}
