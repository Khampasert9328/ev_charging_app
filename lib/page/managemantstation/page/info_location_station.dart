// ignore_for_file: unused_field

import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/Maps/simple_map.dart';
import 'package:ev_charging/page/managemantstation/getlocation/getlocation.dart';
import 'package:ev_charging/page/managemantstation/models/cily/city_models.dart';
import 'package:ev_charging/page/managemantstation/models/province/province_models.dart';
import 'package:ev_charging/page/managemantstation/models/village/village_models.dart';
import 'package:ev_charging/page/managemantstation/provider/infon_location_provider.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
import 'package:ev_charging/widget/dropdown/dropwonwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class InfoLocationStation extends StatefulWidget {
  const InfoLocationStation({super.key});

  @override
  State<InfoLocationStation> createState() => _InfoLocationStationState();
}

class _InfoLocationStationState extends State<InfoLocationStation> {
  TextEditingController nameplace = TextEditingController();
  TextEditingController nameplacilitie = TextEditingController();

  final _latitude = TextEditingController();
  final _longitude = TextEditingController();

  final Completer<GoogleMapController> _controller = Completer();
  String? proId;
  bool? update;
  double? lat;
  double? long;
  late LatLng _kMapCenter;
  bool? loading;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  String? province;
  String? district;
  String? village;
  String? valueitem;
  bool onOpenvil = false;
  int lengthtext = 1;

  _getLocation() async {
    final model = context.read<InfoLocationProvider>();
    loading = true;
    await GetLocation.determinePosition().then((value) => {
          model.setLatitude(value.latitude.toString()),
          model.setLongitude(value.longitude.toString()),
        });
    setState(() {
      _kMapCenter = LatLng(double.parse(model.latitude ?? "0.0"), double.parse(model.longtitude ?? "0.0"));
    });
    loading = false;
  }

  Future _update() async {
    final GoogleMapController mapController = await _controller.future;
    if (update == true) {
      setState(() {
        mapController.animateCamera(CameraUpdate.newLatLng(LatLng(
            double.parse(context.read<InfoLocationProvider>().latitude!),
            double.parse(context.read<InfoLocationProvider>().longtitude!))));
      });
    }
  }

  @override
  void initState() {
    final model = context.read<InfoLocationProvider>();
    _getLocation();
    if (_latitude.text != model.latitude) {
      _latitude.text = model.latitude ?? "0.0";
    }
    if (_longitude.text != model.longtitude) {
      _longitude.text = model.longtitude ?? "0.0";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoLocationProvider>(builder: (ctn, models, child) {
      return Column(
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translation(context).province,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  DropDownWidget(
                    item: ProVinceModel.province.map((Map value) {
                      return DropdownMenuItem<String>(
                        value: value["_id"],
                        child: Text(value["pro_name"]),
                      );
                    }).toList(),
                    value: province,
                    onChange: (String? value) {
                      setState(() {
                        province = value!;
                        district =
                            CityModel.city.where((element) => element["pro_id"] == province).map((e) => e["_id"]).first;
                        village = Village.village
                            .where((element) => element["dist_id"] == district)
                            .map((e) => e["_id"])
                            .first;

                        models.proName = ProVinceModel.province
                            .where((element) => element["_id"] == province)
                            .map((e) => e["pro_name"])
                            .toString();

                        ///set district Id
                        models.disName = CityModel.city
                            .where((element) => element["_id"] == district)
                            .map((e) => e["dist_name"])
                            .toString();

                        /// set village id
                        models.villName = Village.village
                            .where((element) => element["_id"] == village)
                            .map((e) => e["vill_name"])
                            .toString();
                      });
                    },
                    hint: '',
                    validator: (value) {
                      if (value == null || value == "") {
                        return 'ກະລຸນາເລືອກຂໍ້ມູນ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    translation(context).district,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: DropDownWidget(
                      item: CityModel.city.where((element) => element["pro_id"] == province).map((Map value) {
                        return DropdownMenuItem<String>(value: value["_id"], child: Text(value["dist_name"]));
                      }).toList(),
                      value: district,
                      onChange: (String? value) {
                        setState(() {
                          district = value!;

                          ///set district name
                          models.disName = CityModel.city
                              .where((element) => element["_id"] == district)
                              .map((e) => e["dist_name"])
                              .toString();

                          ///change village Id
                          village = Village.village
                              .where((element) => element["dist_id"] == district)
                              .map((e) => e["_id"])
                              .first;

                          ///set village name
                          models.villName = Village.village
                              .where((element) => element["_id"] == village)
                              .map((e) => e["vill_name"])
                              .toString();

                          ///set district Id
                          models.setCity(value);

                          /// set village id
                          models.setVillage(village ?? "");
                        });
                      },
                      hint: '',
                      validator: (value) {
                        if (value == null || value == "") {
                          return 'ກະລຸນາເລືອກຂໍ້ມູນ';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text(
                    translation(context).village,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  DropDownWidget(
                    item: Village.village
                        .where((element) => element["dist_id"] == district)
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value["_id"],
                        child: Text(value["vill_name"]),
                      );
                    }).toList(),
                    value: village,
                    onChange: (String? value) {
                      setState(() {
                        onOpenvil = true;
                        village = value!;
                        models.setVillage(value);
                        models.villName = Village.village
                            .where((element) => element["_id"] == village)
                            .firstWhere((e) => e["vill_name"])
                            .toString();
                      });
                    },
                    hint: '',
                    validator: (value) {
                      if (value == null || value == "") {
                        return 'ກະລຸນາເລືອກຂໍ້ມູນ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    translation(context).placename,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      models.setNamPlace(value);
                    },
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.grey,
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ກາລຸນາປ້ອນຊື່ສະຖານທີ່";
                      }
                      return null;
                    },
                    controller: nameplace,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "ປ້ອນຊື່ສະຖານທີ່",
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translation(context).facility,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: models.facilities.length,
                      itemBuilder: (context, index) {
                        return Row(children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.grey,
                              obscureText: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ກາລຸນາປ້ອນຊື່ບໍລິສັດ";
                                }
                                return null;
                              },
                              controller: models.facilities[index],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: "ຕົວຢ່າງ: ຮ້ານ Amazon Cafe",
                              ),
                            ),
                          ),
                          models.facilities.length == 1
                              ? const SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    models.delFacilities(index);
                                  },
                                  child: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                  ),
                                )
                        ]);
                      }),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      models.addFacilities();
                    },
                    child: DottedBorder(
                      color: EV_Colors.yellowbtncolor,
                      radius: Radius.circular(10),
                      child: Container(
                          alignment: Alignment.center,
                          height: 45.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            translation(context).addplace,
                            style: TextStyle(
                              color: EV_Colors.yellowbtncolor,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translation(context).location,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
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
                                target: LatLng(double.parse(models.latitude!), double.parse(models.longtitude!)),
                                zoom: 50.0,
                                tilt: 0,
                                bearing: 0),
                            markers: {
                              Marker(
                                markerId: const MarkerId("1"),
                                position: LatLng(double.parse(models.latitude!), double.parse(models.longtitude!)),
                                icon: markerIcon,
                              )
                            },
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          )),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      update = await Navigator.push(
                          context, PageTransition(child: const SimpleMaps(), type: PageTransitionType.fade));
                      if (update == true) {
                        setState(() {
                          _update();
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: EV_Colors.yellowbtncolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        translation(context).chooselocation,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
