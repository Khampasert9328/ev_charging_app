// ignore_for_file: must_be_immutable
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/Maps/detail_map.dart';
import 'package:ev_charging/page/managemantstation/edit_info-station.dart';
import 'package:ev_charging/page/managemantstation/models/get_info_charg_models.dart';
import 'package:ev_charging/utils/set_image_charger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EditInfoStation(
                            models: widget.models,
                            controllers: widget.models!.constainner,
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset("images/Edit.svg"),
            ),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          Navigator.push(
              context,
              PageTransition(
                  child: DetailMaps(
                    lat: widget.models!.latLocation,
                    long: widget.models!.lngLacation,
                  ),
                  type: PageTransitionType.fade));
        },
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
          alignment: Alignment.center,
          height: 46.h,
          width: double.infinity,
          decoration: BoxDecoration(color: EV_Colors.yellowbtncolor, borderRadius: BorderRadius.circular(10)),
          child: Text(
            "ເບິ່ງຕຳແໜ່ງ",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: EV_Colors.whitecolor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              decoration: BoxDecoration(
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
                                      widget.models!.name,
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
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "ຈຳນວນຕູ້ສາກ:",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "${widget.models!.amount}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: EV_Colors.yellowbtncolor,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "ຕູ້",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: widget.models!.constainner.length,
                itemBuilder: (context, index) {
                  final data = widget.models!.constainner[index];
                  return Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ຕູ້ທີ:${index + 1}",
                              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "ຍີ່ຫໍ້: ${data.brand}",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text(
                              "ລຸ້ນ: ${data.generation}",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text(
                              "ໂມເດລ: ${data.model}",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text(
                              "ປະເພດຫົວສາກ:",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: List.generate(
                                widget.models!.constainner[index].typeCharge.length,
                                (i) {
                                  return Column(
                                    children: [
                                      SvgPicture.asset(
                                          image(widget.models!.constainner[index].typeCharge[i].typeCharging)),
                                      Text(widget.models!.constainner[index].typeCharge[i].typeCharging),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            Divider(),
            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ສິ່ງອຳນວຍຄວາມສະດວກ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  for (var i in widget.models!.facilities)
                    Text(
                      "- ${i.facilitie}",
                      style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
