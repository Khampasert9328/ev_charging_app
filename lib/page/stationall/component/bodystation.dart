import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/stationall/component/stationdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyStation extends StatefulWidget {
  const BodyStation({super.key});

  @override
  State<BodyStation> createState() => _BodyStationState();
}

class _BodyStationState extends State<BodyStation> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => StationDetail()));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StationDetail(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          
                          child: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
