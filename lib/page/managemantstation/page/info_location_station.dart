import 'package:dotted_border/dotted_border.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/models/cily/city_models.dart';
import 'package:ev_charging/page/managemantstation/models/province/province_models.dart';
import 'package:ev_charging/page/managemantstation/models/village/village_models.dart';
import 'package:ev_charging/page/managemantstation/provider/infon_location_provider.dart';
import 'package:ev_charging/widget/dropdown/dropwonwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'textformfield/textform.dart';

class InfoLocationStation extends StatefulWidget {
  const InfoLocationStation({super.key});

  @override
  State<InfoLocationStation> createState() => _InfoLocationStationState();
}

class _InfoLocationStationState extends State<InfoLocationStation> {
  TextEditingController nameplace = TextEditingController();
  TextEditingController nameplacilitie = TextEditingController();
  String? proId;

  String? province;
  String? district;
  String? village;
  String? valueitem;
  bool onOpenvil = false;
  int lengthtext = 1;
  // List province = [
  //   "ຫົວສາກ A",
  //   "ຫົວສາກ B",
  //   "ຫົວສາກ C",
  //   "ຫົວສາກ D",
  // ];
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
                    "ແຂວງ",
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
                    "ເມືອງ",
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
                    "ບ້ານ",
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
                    "ຊື່ສະຖານທີ່",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  TextFormInfo(
                    text: "ປ້ອນຊື່ສະຖານທີ່",
                    controller: nameplace,
                    onchange: () {},
                    ontap: (value) {
                      models.setNamPlace(value);
                    },
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
                    "ສິ່ງອຳນວຍຄວາມສະດວກ",
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
                      itemCount: models.lengthplace,
                      itemBuilder: (context, index) {
                        return Row(children: [
                          Expanded(
                            child: TextFormInfo(
                              text: "ຕົວຢ່າງ: ຮ້ານ Amazon cafe",
                              controller: nameplacilitie,
                              onchange: () {},
                              ontap: (value) {
                                if (models.listplace.isEmpty) {
                                  models.addlistplace(value);
                                }
                                setState(() {
                                  models.listplace[index] = value.toString();
                                });
                              },
                            ),
                          ),
                          models.lengthplace == 1
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    models.deletelengthplace();
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
                      models.addlengthplace();
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
                          child: const Text(
                            "+ ເພີ່ມສະຖານທີ່",
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
        ],
      );
    });
  }
}
