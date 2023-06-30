import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/provider/info_company_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/infon_location_provider.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
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
                    translation(context).owner,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        translation(context).company,
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
                    translation(context).logocompany,
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
                    translation(context).infomationcharge,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${translation(context).amount}: ${model2.containersList.length} ${translation(context).containnerchange}",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model2.model.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${translation(context).containnerchange}:${index + 1}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(translation(context).branch),
                                Text(model2.brand[index].text),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(translation(context).generation),
                                Text(model2.generation[index].text),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(translation(context).models),
                                Text(model2.model[index].text),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(translation(context).chargetype),
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
                    translation(context).imageplace,
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
                    translation(context).infomationlocation,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(translation(context).province),
                      Text(model3.province!.replaceAll("(", "").replaceAll(")", "")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(translation(context).district),
                      Text(model3.city!.replaceAll("(", "").replaceAll(")", "")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(translation(context).village),
                      Text(model3.village!.replaceAll("(", "").replaceAll(")", "")),
                    ],
                  ),
                  Divider(),
                  Text(
                    translation(context).location,
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
                    translation(context).facility,
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
