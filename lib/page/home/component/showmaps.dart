import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ev_charging/busines%20logic/infocharg/info_charg_provider.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/home/provider/getchargebyid_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_map_marker_animation/widgets/animarker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'package:sliding_sheet/sliding_sheet.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({super.key});

  @override
  State<ShowMaps> createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  final List<Marker> _marker = [];
  final controller = Completer<GoogleMapController>();

  Future<void> _onMapCreate(GoogleMapController controller) async {
    final data = context.read<InfoChargProvider>().getchargmodels!.data;
    Future<Uint8List> getBytesFromAsset(String path, int width) async {
      ByteData data = await rootBundle.load(path);
      ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
          targetWidth: width);
      ui.FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
          .buffer
          .asUint8List();
    }

    final Uint8List markerIcon =
        await getBytesFromAsset('images/logocharge.png', 150);

    _marker.clear();
    setState(() {
      for (var i = 0; i < data.length; i++) {
        _marker.add(
          Marker(
            onTap: () {
              Provider.of<GetChargeByIdProvider>(context, listen: false)
                  .getchargebyid(data[i].id);
              showSlidingBottomSheet(
                context,
                builder: (_) => SlidingSheetDialog(
                  cornerRadius: 16,
                  avoidStatusBar: true,
                  snapSpec: const SnapSpec(
                    initialSnap: 0.7,
                    snappings: [0.4, 0.7, 1],
                  ),
                  headerBuilder: (context, state) {
                    return Container(
                      height: 30.h,
                      width: double.infinity,
                      color: EV_Colors.yellowbtncolor,
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        height: 10.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                  builder: (context, state) {
                    return Consumer<GetChargeByIdProvider>(
                        builder: (context, model, child) {
                      if (model.isloading) {
                        return Center(
                          child: Image.asset(
                            "images/loading.gif",
                            height: 50.h,
                            width: 50.w,
                          ),
                        );
                      }
                      return Material(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 150.h,
                                  width: double.infinity,
                                  imageUrl:
                                      "${model.models!.data.pictureplace}",
                                  placeholder: (context, url) => Center(
                                    child: Image.asset(
                                      "images/loading.gif",
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Divider(),
                              Container(
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      height: 50.h,
                                      width: 50.w,
                                      imageUrl:
                                          "${model.models!.data.imagecpn}",
                                      placeholder: (context, url) =>
                                          Image.asset(
                                        "images/loading.gif",
                                        height: 50.h,
                                        width: 50.w,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${model.models!.data.nameplace}",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                            "ເຈົ້າຂອງ: ${model.models!.data.name}"),
                                        Text(
                                            "ສະຖານທີ່: ${model.models!.data.village} ${model.models!.data.district} ${model.models!.data.province}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Text(
                                "ຂໍ້ມູນຕູ້ສາກ",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("ຈຳນວນຕູ້ສາກ: ${model.models!.data.amount}"),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      model.models!.data.constainner.length,
                                  itemBuilder: (context, index) {
                                    final data =
                                        model.models!.data.constainner[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ຕູ້ທີ ${index += 1}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          "ຍີ່ຫໍ້: ${data.brand}",
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                        Text(
                                          "ລຸ້ນ: ${data.generation}",
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                        Text(
                                          "ໂມເດລ: ${data.model}",
                                          style: TextStyle(fontSize: 14.sp),
                                        )
                                      ],
                                    );
                                  }),
                              Divider(),
                              Text(
                                "ສຶ່ງອຳນວຍຄວາມສະດວກ",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      model.models!.data.facilities.length,
                                  itemBuilder: (context, index) {
                                    final data =
                                        model.models!.data.facilities[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "- ${data.facilitie}",
                                          style: TextStyle(fontSize: 14.sp),
                                        )
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              );
            },
            icon: BitmapDescriptor.fromBytes(markerIcon),
            markerId: MarkerId(data[i].id),
            position: LatLng(
              double.parse(data[i].latLocation.toString()),
              double.parse(
                data[i].lngLacation.toString(),
              ),
            ),
            infoWindow:
                InfoWindow(title: data[i].name, anchor: Offset(0.2, 0.0)),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    context.read<InfoChargProvider>().getchargprovider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoChargProvider>(builder: ((context, value, child) {
      if (value.isload) {
        return Center(
            child: CircularProgressIndicator(
          color: Colors.yellow[700],
        ));
      }
      return Container(
        color: Colors.grey,
        child: Animarker(
          mapId: controller.future.then((value) => value.mapId),
          curve: Curves.ease,
          markers: Set<Marker>.of(_marker),
          child: GoogleMap(
            markers: Set<Marker>.of(_marker),
            onMapCreated: _onMapCreate,
            initialCameraPosition: CameraPosition(
              zoom: 16.0,
              target: LatLng(
                double.parse(
                    value.getchargmodels!.data[0].latLocation.toString()),
                double.parse(
                    value.getchargmodels!.data[0].lngLacation.toString()),
              ),
            ),
            mapType: MapType.normal,
          ),
        ),
      );
    }));
  }
}
