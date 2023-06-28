// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:dotted_border/dotted_border.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/models/cily/city_models.dart';
import 'package:ev_charging/page/managemantstation/models/get_info_charg_models.dart';
import 'package:ev_charging/page/managemantstation/models/province/province_models.dart';
import 'package:ev_charging/page/managemantstation/models/village/village_models.dart';
import 'package:ev_charging/page/managemantstation/page/textformfield/textform.dart';
import 'package:ev_charging/page/managemantstation/provider/infon_location_provider.dart';
import 'package:ev_charging/widget/dialog/loading.dart';
import 'package:ev_charging/widget/dropdown/dropwonwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BodyEditStation extends StatefulWidget {
  DataGetInfoCharg? models;
  List<Constainner>? containner;
  BodyEditStation({super.key, required this.models, required this.containner});

  @override
  State<BodyEditStation> createState() => _BodyEditStationState();
}

class _BodyEditStationState extends State<BodyEditStation> {
  List item = [
    "1",
    "2",
    "3",
    "4",
  ];
  List itemtype = [
    "ຫົວສາກ A",
    "ຫົວສາກ B",
    "ຫົວສາກ C",
    "ຫົວສາກ D",
  ];

  String? valueitemtype;
  String? valueitem;
  int lengthdropdown = 1;
  int lengthtext = 1;
  TextEditingController brand = TextEditingController();
  TextEditingController generation = TextEditingController();
  TextEditingController model = TextEditingController();
  final namcompany = TextEditingController();
  TextEditingController namplace = TextEditingController();
  TextEditingController namplacilities = TextEditingController();
  List<TypeCharge> typecharg = [];
  String? count;
  String? provinces;
  String? district;
  String? village;
  String? nameplace;
  String? imagelogo;
  String? imageplace;

  int? length;

  @override
  void initState() {
    namcompany.text = widget.models!.name;
    count = widget.models!.amount.toString();
    length = widget.models!.amount;
    nameplace = widget.models!.nameplace;
    imagelogo = widget.models!.imagecpn;
    imageplace = widget.models!.pictureplace;
    //provinces = widget.models!.province;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoLocationProvider>(builder: (ctn, models, child) {
      return Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () async {
            EVDialog().showDialogSuccess(context, "ແຈ້ງເຕືອນ", "ແກ້ໄຂຂໍ້ມູນສຳເລັດແລ້ວ", () {});
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
            alignment: Alignment.center,
            height: 46.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: EV_Colors.yellowbtncolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "ອັບເດດຂໍ້ມູນ",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: EV_Colors.whitecolor,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(19.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ຂໍ້ມູນເຈົ້າຂອງ",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 9.h,
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
                    padding: const EdgeInsets.all(23.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ບໍລິສັດ",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.grey,
                          controller: namcompany,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "ໂລໂກ້ບໍລິສັດ",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: 210.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("${imagelogo}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [EV_Colors.whitecolor.withOpacity(0.2), EV_Colors.yellowbtncolor],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.image,
                                  color: EV_Colors.whitecolor,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text(
                                  "ແກ້ໄຂຮູບພາບ",
                                  style: TextStyle(
                                    color: EV_Colors.whitecolor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Text(
                  "ຂໍ້ມູນຕູ້ສາກ",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                      "ຈຳນວນຕູ້ສາກ",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Text(models.containersList.length.toString()),
                            Spacer(),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll<Color>(EV_Colors.yellowbtncolor)),
                                  onPressed: () {
                                    //models.increment();
                                  },
                                  child: Text(
                                    "ເພີ່ມ",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll<Color>(EV_Colors.yellowbtncolor)),
                                    onPressed: () {
                                      // if (models.containersList.length > 1) {
                                      //   models.brand.removeAt(models.containersList.length - 1);
                                      //   models.model.removeAt(models.containersList.length - 1);
                                      //   models.generation.removeAt(models.containersList.length - 1);
                                      //   // data.removeAt(models.count-1);
                                      //   models.lopTu();
                                      // }
                                    },
                                    child: Text(
                                      "ລົບ",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                    )),
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: widget.models!.constainner.length,
                    itemBuilder: (context, index) {
                      for (var i in widget.models!.constainner) {
                        typecharg = i.typeCharge;
                      }
                      final data = widget.models!.constainner[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ຕູ້ທີ ${item[index]}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
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
                                    "ຍີ່ຫໍ້",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.grey,
                                    initialValue: data.brand,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text(
                                    "ລຸ້ນ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.grey,
                                    initialValue: data.generation,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text(
                                    "ໂມເດລ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  TextFormInfo(
                                    text: "ປ້ອນຊື່ໂມເດລ",
                                    controller: model,
                                    onchange: () {},
                                    ontap: (value) {},
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text(
                                    "ປະເພດຫົວສາກ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),

                                  //dropdown ປະເພດຫົວສາກ


                              //     Column(
                              //   children:
                              //       List.generate(models.containersList[index1].typeChargingList.length, (index2) {
                              //     return Row(
                              //       children: [
                              //         Expanded(
                              //           child: Container(
                              //             margin: EdgeInsets.only(bottom: 10),
                              //             padding: const EdgeInsets.only(
                              //               left: 10,
                              //               right: 10,
                              //             ),
                              //             decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.circular(10),
                              //               color: Colors.grey[200],
                              //             ),
                              //             child: DropdownButton(
                              //                 isExpanded: true,
                              //                 underline: const SizedBox(),
                              //                 hint: const Text('ເລືອກປະເພດຫົວສາກ'),
                              //                 value:
                              //                     models.containersList[index1].typeChargingList[index2].typeCharging,
                              //                 items: AppData.itemtype.map((e) {
                              //                   return DropdownMenuItem(value: e, child: Text(e));
                              //                 }).toList(),
                              //                 onChanged: (value) {
                              //                   models.dropDown(index1, index2, value.toString());
                              //                 }),
                              //           ),
                              //         ),
                              //         models.containersList[index1].typeChargingList.length == 1
                              //             ? const SizedBox()
                              //             : GestureDetector(
                              //                 onTap: () {
                              //                   models.delLength(index1);
                              //                 },
                              //                 child: const Icon(
                              //                   Icons.remove_circle_outline,
                              //                   color: Colors.red,
                              //                 ),
                              //               )
                              //       ],
                              //     );
                              //   }),
                              // ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        lengthdropdown += 1;
                                      });
                                    },
                                    child: DottedBorder(
                                      color: EV_Colors.yellowbtncolor,
                                      radius: const Radius.circular(10),
                                      child: Container(
                                          alignment: Alignment.center,
                                          height: 45.h,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: const Text(
                                            "+ ເພີ່ມປະເພດຫົວສາກ",
                                            style: TextStyle(
                                              color: EV_Colors.yellowbtncolor,
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                SizedBox(
                  height: 15.h,
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
                    padding: const EdgeInsets.all(23.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ຮູບພາບສະຖານທີ່",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: 210.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("${imageplace}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [EV_Colors.whitecolor.withOpacity(0.2), EV_Colors.yellowbtncolor],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.image,
                                  color: EV_Colors.whitecolor,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text(
                                  "ແກ້ໄຂຮູບພາບ",
                                  style: TextStyle(
                                    color: EV_Colors.whitecolor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Text(
                  "ຂໍ້ມູນສະຖານທີ່",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
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
                          value: provinces,
                          onChange: (String? value) {
                            setState(() {
                              provinces = value!;
                              district = CityModel.city
                                  .where((element) => element["pro_id"] == widget.models!.province)
                                  .map((e) => e["_id"])
                                  .first;
                              village = Village.village
                                  .where((element) => element["dist_id"] == district)
                                  .map((e) => e["_id"])
                                  .first;

                              models.proName = ProVinceModel.province
                                  .where((element) => element["_id"] == widget.models!.province)
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
                          hint: widget.models!.province,
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
                            item: CityModel.city.where((element) => element["pro_id"] == provinces).map((Map value) {
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
                            hint: widget.models!.district,
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
                              village = value!;
                              models.setVillage(value);
                              models.villName = Village.village
                                  .where((element) => element["_id"] == village)
                                  .firstWhere((e) => e["vill_name"])
                                  .toString();
                            });
                          },
                          hint: widget.models!.village,
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
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.grey,
                          initialValue: nameplace,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
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
                            itemCount: widget.models!.facilities.length,
                            itemBuilder: (context, index) {
                              return Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.grey,
                                    initialValue: widget.models!.facilities[index].facilitie,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                  ),
                                ),
                                lengthtext == 1
                                    ? SizedBox()
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            lengthtext -= 1;
                                          });
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
                            setState(() {
                              lengthtext += 1;
                            });
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
            ),
          ),
        ),
      );
    });
  }
}
