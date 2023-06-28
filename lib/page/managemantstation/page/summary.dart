import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/provider/info_company_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/infon_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  bool? loading;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Consumer3<InfoCompanyProvider, InfoContainerProvider, InfoLocationProvider>(
        builder: (ctn, model1, model2, model3, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ເຈົ້າຂອງບໍລິສັດ:",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ຊື່ບໍລິສັດ:",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        "${model1.namcompany}",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "ໂລໂກ້:",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: "${model1.imageUrl}",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Divider(),
                  Text(
                    "ຂໍ້ມູນຕູ້ສາກ",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "ຈຳນວນ: ${model2.containersList.length} ຕູ້",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model2.containersList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ຕູ້ທີ:${index + 1}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ຍີ່ຫໍ້ຕູ້:"),
                                Text(model2.brand[index].text),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ລຸ້ນ:"),
                                Text(model2.generation[index].text),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ໂມເດລ:"),
                                Text(model2.model[index].text),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ປະເພດຫົວສາກ:"),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: List.generate(model2.containersList[index].typeChargingList.length,
                                          (i) => Text(model2.containersList[index].typeChargingList[i].typeCharging)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        );
                      }),
                  Text(
                    "ຮູບພາບສະຖານທີ່:",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: "${model2.imageUrl}",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Divider(),
                  Text(
                    "ຂໍ້ມູນທີ່ຕັ້ງ:",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ແຂວງ:"),
                      Text(model3.province!.replaceAll("(", "").replaceAll(")", "")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ເມືອງ:"),
                      Text(model3.city!.replaceAll("(", "").replaceAll(")", "")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ບ້ານ:"),
                      Text(model3.village!.replaceAll("(", "").replaceAll(")", "")),
                    ],
                  ),
                  Divider(),
                  Text(
                    "ຕ່ຳແໜ່ງທີ່ຕັ້ງ:",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("latitude:"),
                      Text(model3.latitude!),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("longtitude:"),
                      Text(model3.longtitude!),
                    ],
                  ),

                  SizedBox(height: 5.h,),
                   loading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.satellite,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(double.parse(model3.latitude!), double.parse(model3.longtitude!)),
                                zoom: 50.0,
                                tilt: 0,
                                bearing: 0),
                            markers: {
                              Marker(
                                markerId: const MarkerId("1"),
                                position: LatLng(double.parse(model3.latitude!), double.parse(model3.longtitude!)),
                                icon: markerIcon,
                              )
                            },
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          )),
                   Divider(),
                  Text(
                    "ສິ່ງອຳນວຍຄວາມສະດວກ:",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: model3.listplace.length,
                      itemBuilder: ((context, index) {
                        return Text("-${model3.listplace[index].toString()}");
                      })),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
