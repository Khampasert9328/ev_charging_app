// ignore_for_file: avoid_unnecessary_containers

import 'package:ev_charging/busines%20logic/infocharg/info_charg_provider.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/add_station.dart';
import 'package:ev_charging/page/managemantstation/station_detail_can_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AllItem extends StatefulWidget {
  const AllItem({super.key});

  @override
  State<AllItem> createState() => _AllItemState();
}

class _AllItemState extends State<AllItem> {
  @override
  void initState() {
    context.read<InfoChargProvider>().getchargprovider();
    super.initState();
  }

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        context.read<InfoChargProvider>().getchargprovider();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddStation()));
        },
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
          alignment: Alignment.center,
          height: 46.h,
          width: double.infinity,
          decoration: BoxDecoration(color: EV_Colors.yellowbtncolor, borderRadius: BorderRadius.circular(10)),
          child: Text(
            "ເພີ່ມຂໍ້ມູນສະຖານີໃໝ່",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: EV_Colors.whitecolor,
            ),
          ),
        ),
      ),
      //
      body: RefreshIndicator(
        color: Colors.yellow,
        onRefresh: _refresh,
        child: Consumer<InfoChargProvider>(
          builder: (context, model, child) {
            return model.isload == true
                ? Center(
                    child: Image.asset(
                    "images/loading.gif",
                    height: 50.h,
                    width: 50.w,
                  ))
                : model.getchargmodels == null
                    ? const Center(
                        child: Text("ບໍ່ມີຂໍ້ມູນ"),
                      )
                    : ListView.builder(
                        itemCount: model.getchargmodels!.data.length,
                        itemBuilder: (context, index) {
                          final data = model.getchargmodels!.data[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => StationDetailCanEdit(
                                      models: data,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.all(8.0),
                                height: 90.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: EV_Colors.whitecolor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 7,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ],
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(8.0),
                                  padding: EdgeInsets.all(8.0),
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: EV_Colors.whitecolor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 7,
                                        color: Colors.black.withOpacity(0.1),
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          AspectRatio(
                                              aspectRatio: 0.7,
                                              child: Image.network(
                                                data.imagecpn,
                                              )),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          SizedBox(
                                            width: 0.5.sw,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "${data.nameplace}",
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "ເຈົ້າຂອງ: ",
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${data.name}",
                                                      style:
                                                          TextStyle(fontSize: 12.sp, color: EV_Colors.yellowbtncolor),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "ສະຖານທີ່: ",
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        "ແຂວງ ${data.province} ເມືອງ ${data.district} ບ້ານ ${data.village}",
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: EV_Colors.yellowbtncolor,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(Icons.keyboard_arrow_right),
                                    ],
                                  ),
                                ),
                              ));
                        });
          },
        ),
      ),
    );
  }
}
