// ignore_for_file: must_be_immutable

import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/edit_info-station.dart';
import 'package:ev_charging/page/managemantstation/models/get_info_charg_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StationDetailCanEdit extends StatefulWidget {
  DataGetInfoCharg? models;
   StationDetailCanEdit({super.key, required this.models});

  @override
  State<StationDetailCanEdit> createState() => _StationDetailCanEditState();
}

class _StationDetailCanEditState extends State<StationDetailCanEdit> {
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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => EditInfoStation()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset("images/Edit.svg"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.h,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("${widget.models!.pictureplace}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [EV_Colors.whitecolor.withOpacity(0.2), EV_Colors.yellowbtncolor])),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage("${widget.models!.imagecpn}"),
                            backgroundColor: EV_Colors.whitecolor,
                            radius: 30,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          SizedBox(
                           width: 0.5.sw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.models!.nameplace}",
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
                                      "${widget.models!.name}",
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
                                    Flexible(
                                      child: Text(
                                        "ແຂວງ:${widget.models!.province} ເມືອງ${widget.models!.district} ບ້ານ ${widget.models!.village}",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: EV_Colors.whitecolor,
                                          overflow: TextOverflow.ellipsis,
                                          
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                        "${widget.models!.amount}",
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
                          Text("${widget.models!.constainner[0].typeCharge[0].typeCharging}"),
                          //Text("120KW/T DC"),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset("images/EV Charger-03.svg"),
                          Text("${widget.models!.constainner[0].typeCharge[0].typeCharging}"),
                          //Text("120KW/T DC"),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  
                   Text(
                    "ສິ່ງອຳນວຍຄວາມສະດວກ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                    ),
                  ),
                  for(var i in widget.models!.facilities)
                  Text(
                    "- ${i.facilitie}",
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  ),
                  // Text(
                  //   "ຮ້ານ ກາເຟສີນຸກ",
                  //   style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  // ),
                  // Text(
                  //   "ຮ້ານ ປັ່ນໝາກໄມ້",
                  //   style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  // ),
                  // Text(
                  //   "ຮ້ານ ຂາຍເຄື່ອງທົ່ວໄປ",
                  //   style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
