import 'package:ev_charging/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StationDetail extends StatefulWidget {
  const StationDetail({super.key});

  @override
  State<StationDetail> createState() => _StationDetailState();
}

class _StationDetailState extends State<StationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          "ລາຍລະອຽດສະຖານີ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/image1.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                      EV_Colors.whitecolor.withOpacity(0.2),
                      EV_Colors.yellowbtncolor
                    ])),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: EV_Colors.whitecolor,
                            radius: 30,
                            child: Image.asset("images/loca.png"),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ສູນການຄ້າພາກຊັນ",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: EV_Colors.whitecolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "ເຈົ້າຂອງ: ",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: EV_Colors.whitecolor,
                                    ),
                                  ),
                                  Text(
                                    "ບໍລິສັດ ໂລກ້າ ຈຳກັດ",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: EV_Colors.whitecolor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "ສະຖານທີ່: ",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: EV_Colors.whitecolor,
                                    ),
                                  ),
                                  Text(
                                    "ນະຄອນຫລວງວຽງຈັນ ເມືອງ ໄຊເສດຖາ ບ້ານ ໜອງຈັນ",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: EV_Colors.whitecolor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "ຈຳນວນຕູ້ສາກ:",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "02",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: EV_Colors.yellowbtncolor,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "ຕູ້",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "ປະເພດຫົວສາກ:",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset("images/EV Charger-02.svg"),
                          Text("GB/T DC"),
                          Text("120KW/T DC"),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset("images/EV Charger-03.svg"),
                          Text("CSS 2"),
                          Text("120KW/T DC"),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  const Text(
                    "ສິ່ງອຳນວຍຄວາມສະດວກ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Text(
                    "ຮ້ານ ເຂົ້າປຸ້ນແຈ່ວຂີງເຈົ້າເກົ່າ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp
                      
                    ),
                  ),
                  Text(
                    "ຮ້ານ ກາເຟສີນຸກ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp
                      
                    ),
                  ),
                  Text(
                    "ຮ້ານ ປັ່ນໝາກໄມ້",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp
                      
                    ),
                  ),
                  Text(
                    "ຮ້ານ ຂາຍເຄື່ອງທົ່ວໄປ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp
                      
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
