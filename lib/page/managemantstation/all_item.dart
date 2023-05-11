// ignore_for_file: avoid_unnecessary_containers

import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/add_station.dart';
import 'package:ev_charging/page/managemantstation/station_detail_can_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllItem extends StatefulWidget {
  const AllItem({super.key});

  @override
  State<AllItem> createState() => _AllItemState();
}

class _AllItemState extends State<AllItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AddStation()));
        },
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
          alignment: Alignment.center,
          height: 46.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: EV_Colors.yellowbtncolor,
              borderRadius: BorderRadius.circular(10)),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => StationDetailCanEdit()));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 100.h,
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
                      Image.asset(
                        "images/loca.png",
                        height: 50.h,
                        width: 50.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ສູນການຄ້າພາກຊັນ",
                            style: TextStyle(
                              fontSize: 18.sp,
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
                                "ບໍລິສັດ ໂລກ້າ ຈຳກັດ",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: EV_Colors.yellowbtncolor),
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
                              Text(
                                "ນະຄອນຫລວງວຽງຈັນ ເມືອງ ໄຊເສດຖາ ບ້ານ ໜອງຈັນ",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: EV_Colors.yellowbtncolor),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: const Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
    ;
  }
}
