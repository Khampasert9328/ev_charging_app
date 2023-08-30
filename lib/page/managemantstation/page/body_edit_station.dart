// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:dotted_border/dotted_border.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/models/get_info_charg_models.dart';
import 'package:ev_charging/page/managemantstation/page/textformfield/textform.dart';
import 'package:ev_charging/page/managemantstation/provider/update_info_provider.dart';
import 'package:ev_charging/page/managemantstation/service/update_station_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constant/data.dart';

class BodyEditStation extends StatefulWidget {
  DataGetInfoCharg? models;

  BodyEditStation({super.key, required this.models});

  @override
  State<BodyEditStation> createState() => _BodyEditStationState();
}

class _BodyEditStationState extends State<BodyEditStation> {


  String value = '';
  bool isOnPress = false;

  void loopContainer(){
    final info = context.read<UpdateInfoProvider>();
   if(info.containersList.isEmpty){
     for(int i = 0; i < widget.models!.constainner.length; i++){
       info.containersList.add(UpdateTypeCharge(typeChargingList: [
         for(int j = 0; j < widget.models!.constainner[i].typeCharge.length; j++)
           UpdateTypeCharging(typeCharging: widget.models!.constainner[i].typeCharge[j].typeCharging, index: i)
       ]));
      }
   }}



  void getTextController(){
    final info = context.read<UpdateInfoProvider>();
    for(int i = 0; i < widget.models!.constainner.length; i++){
      // info.containerListModel =  widget.models!.constainner;
      info.getBrandTextCtr();
      info.getGenTextCtr();
      info.getModelTextCtr();

      info.brand[i].text = widget.models!.constainner[i].brand;
      info.gen[i].text = widget.models!.constainner[i].generation;
      info.model[i].text = widget.models!.constainner[i].model;
    }
  }

  void getInfoDetail(){
    final info = context.read<UpdateInfoProvider>();
    final data = widget.models;

    info.namePlace.text = data!.nameplace;
    info.nameCpn.text = data.name;
    info.setImageStation(data.pictureplace);
    info.setImageCpn(data.imagecpn);

    for(int i = 0; i < data.facilities.length; i++){
      info.addFacilities();
      info.facilities[i].text = data.facilities[i].facilitie;

    }
  }

  @override
  void initState() {
    final info = context.read<UpdateInfoProvider>();

    loopContainer();
    getTextController();
    getInfoDetail();
    super.initState();
    print("value:${info.containersList[0].typeChargingList[0].typeCharging}");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateInfoProvider>(builder: (ctn, model, child) {
      return Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () async {
            UpdateStationService.updateStationService(
                context, widget.models!.id, widget.models);
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
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.grey,
                          // initialValue: widget.models?.name,
                          controller: model.nameCpn,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          onChanged: (val) {
                            // model.nameCpn.text = val;
                            print(model.nameCpn.text);
                          },
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
                                  image: NetworkImage("${model.imageCpn}"),
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
                                    ],
                                  ),
                                ),
                              ),
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
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                                Text("${model.containersList.length}"),
                                Spacer(),
                                Row(
                                  children: [
                                    _countBtn(
                                        'ເພີ່ມ', () {
                                      model.addEvCharger();
                                      for(int i = 0; i< model.containersList.length; i++){
                                        print(i);
                                        print(model.containersList.length);
                                      }
                                    }
                                    ),
                                    const SizedBox(width: 10),
                                    model.containersList.isEmpty
                                        ? const SizedBox()
                                        :
                                    _countBtn('ລົບ', () {
                                      model.delEvCharger();
                                    }),
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
                Column(
                  children: List.generate(
                      model.containersList.length,
                      // widget.models!.constainner.length,
                          (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ຕູ້ທີ ${index + 1}",
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
                                    TextFormInfo(
                                      text: "",
                                      controller: model.brand[index],
                                      onchange: () {},
                                      ontap: (val) {
                                        model.brand[index].text = val;
                                      },
                                    ),
                                    // TextFormField(
                                    //   keyboardType: TextInputType.emailAddress,
                                    //   cursorColor: Colors.grey,
                                    //   initialValue: model.brand[index].text,
                                    //   decoration: InputDecoration(
                                    //     border: OutlineInputBorder(
                                    //       borderSide: BorderSide.none,
                                    //       borderRadius: BorderRadius.circular(10),
                                    //     ),
                                    //     filled: true,
                                    //     fillColor: Colors.grey[200],
                                    //   ),
                                    // ),
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
                                    TextFormInfo(
                                      text: "",
                                      controller: model.gen[index],
                                      onchange: () {},
                                      ontap: (val) {
                                        model.gen[index].text = val;
                                      },
                                    ),
                                    // TextFormField(
                                    //   keyboardType: TextInputType.emailAddress,
                                    //   cursorColor: Colors.grey,
                                    //   initialValue: model.gen[index].text,
                                    //   decoration: InputDecoration(
                                    //     border: OutlineInputBorder(
                                    //       borderSide: BorderSide.none,
                                    //       borderRadius: BorderRadius.circular(10),
                                    //     ),
                                    //     filled: true,
                                    //     fillColor: Colors.grey[200],
                                    //   ),
                                    //   onChanged: (val){
                                    //     model.gen[index].text = val;
                                    //   },
                                    // ),
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
                                      controller: model.model[index],
                                      onchange: () {},
                                      ontap: (val) {
                                        model.model[index].text = val;
                                      },
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

                                    Column(
                                      children: List.generate(
                                          model.containersList[index]
                                              .typeChargingList.length,
                                              (index2) {
                                            return Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin:
                                                    EdgeInsets.only(bottom: 10),
                                                    padding: const EdgeInsets
                                                        .only(
                                                      left: 10,
                                                      right: 10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      color: Colors.grey[200],
                                                    ),
                                                    child: DropdownButton(
                                                        isExpanded: true,
                                                        underline: const SizedBox(),
                                                        hint: const Text(
                                                            'ເລືອກປະເພດຫົວສາກ'),
                                                        value:
                                                        // model
                                                        //     .containersList[index]
                                                        //     .typeChargingList.isEmpty ?
                                                        //     widget.models!
                                                        //     .constainner[index]
                                                        //     .typeCharge[index2]
                                                        //     .typeCharging
                                                        //     :
                                                        model
                                                            .containersList[index]
                                                            .typeChargingList[index2]
                                                            .typeCharging,
                                                        items:
                                                        AppData.typeChargeItem
                                                            .map((e) {
                                                          return DropdownMenuItem(
                                                              value: e,
                                                              child: Text(e));
                                                        }).toList(),
                                                        onChanged: (value) {
                                                          model.dropDown(index, index2, value.toString());
                                                        }),
                                                  ),
                                                ),
                                               GestureDetector(
                                                        onTap: () {
                                                          model.delLength(index);
                                                        },
                                                        child: const Icon(
                                                          Icons.remove_circle_outline,
                                                          color: Colors.red,
                                                        ),
                                                      )
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                          model.addLength(index);
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
                ),
                // Column(
                //   children: List.generate(model.containersList.length, (newChargeIndex) {
                //     int oldIndex = widget.models!.constainner.length;
                //     return Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "ຕູ້ທີ ${oldIndex + 1}",
                //           style: TextStyle(
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         Container(
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: EV_Colors.whitecolor,
                //             boxShadow: [
                //               BoxShadow(
                //                 blurRadius: 7,
                //                 color: Colors.black.withOpacity(0.1),
                //               )
                //             ],
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(20.0),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "ຍີ່ຫໍ້",
                //                   style: TextStyle(
                //                     fontSize: 14.sp,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5.h,
                //                 ),
                //                 TextFormInfo(
                //                   text: "",
                //                   controller: model.brand[oldIndex - newChargeIndex],
                //                   onchange: () {},
                //                   ontap: (val){
                //                     // model.brand[index].text = val;
                //                   },
                //                 ),
                //                 // TextFormField(
                //                 //   keyboardType: TextInputType.emailAddress,
                //                 //   cursorColor: Colors.grey,
                //                 //   initialValue: model.brand[index].text,
                //                 //   decoration: InputDecoration(
                //                 //     border: OutlineInputBorder(
                //                 //       borderSide: BorderSide.none,
                //                 //       borderRadius: BorderRadius.circular(10),
                //                 //     ),
                //                 //     filled: true,
                //                 //     fillColor: Colors.grey[200],
                //                 //   ),
                //                 // ),
                //                 SizedBox(
                //                   height: 7.h,
                //                 ),
                //                 Text(
                //                   "ລຸ້ນ",
                //                   style: TextStyle(
                //                     fontSize: 14.sp,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5.h,
                //                 ),
                //                 TextFormInfo(
                //                   text: "",
                //                   controller: model.gen[oldIndex - newChargeIndex],
                //                   onchange: () {},
                //                   ontap: (val){
                //                     // model.gen[index].text = val;
                //                     },
                //                 ),
                //                 // TextFormField(
                //                 //   keyboardType: TextInputType.emailAddress,
                //                 //   cursorColor: Colors.grey,
                //                 //   initialValue: model.gen[index].text,
                //                 //   decoration: InputDecoration(
                //                 //     border: OutlineInputBorder(
                //                 //       borderSide: BorderSide.none,
                //                 //       borderRadius: BorderRadius.circular(10),
                //                 //     ),
                //                 //     filled: true,
                //                 //     fillColor: Colors.grey[200],
                //                 //   ),
                //                 //   onChanged: (val){
                //                 //     model.gen[index].text = val;
                //                 //   },
                //                 // ),
                //                 SizedBox(
                //                   height: 7.h,
                //                 ),
                //                 Text(
                //                   "ໂມເດລ",
                //                   style: TextStyle(
                //                     fontSize: 14.sp,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5.h,
                //                 ),
                //                 TextFormInfo(
                //                   text: "ປ້ອນຊື່ໂມເດລ",
                //                   controller: model.model[oldIndex - newChargeIndex],
                //                   onchange: () {},
                //                   ontap: (val){
                //                     // model.model[index].text = val;
                //                   },
                //                 ),
                //                 SizedBox(
                //                   height: 7.h,
                //                 ),
                //                 Text(
                //                   "ປະເພດຫົວສາກ",
                //                   style: TextStyle(
                //                     fontSize: 14.sp,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5.h,
                //                 ),
                //
                //                 Column(
                //                   children: List.generate(
                //                       model.containersList[newChargeIndex]
                //                           .typeChargingList.length,
                //                     // widget.models!.constainner[index].typeCharge.length,
                //                           (index2) {
                //                         // String valueItem = 'asdnkjas';
                //                     return Row(
                //                       children: [
                //                         Expanded(
                //                           child: Container(
                //                             margin:
                //                                 EdgeInsets.only(bottom: 10),
                //                             padding: const EdgeInsets.only(
                //                               left: 10,
                //                               right: 10,
                //                             ),
                //                             decoration: BoxDecoration(
                //                               borderRadius:
                //                                   BorderRadius.circular(10),
                //                               color: Colors.grey[200],
                //                             ),
                //                             child: DropdownButton(
                //                                 isExpanded: true,
                //                                 underline: const SizedBox(),
                //                                 hint: const Text(
                //                                     'ເລືອກປະເພດຫົວສາກ'),
                //                                 value:
                //                                 model
                //                                     .containersList[newChargeIndex]
                //                                     .typeChargingList[index2]
                //                                 .typeCharging,
                //                                 items:
                //                                     AppData.typeChargeItem.map((e) {
                //                                   return DropdownMenuItem(
                //                                       value: e,
                //                                       child: Text(e));
                //                                 }).toList(),
                //                                 onChanged: (value) {
                //                                   model.dropDown(
                //                                       newChargeIndex,
                //                                       index2,
                //                                       value.toString());
                //                                 }),
                //                           ),
                //                         ),
                //                         // model.containersList[index]
                //                         //             .typeChargingList
                //                         //             .length ==
                //                         //         1
                //                         //     ? const SizedBox()
                //                         //     : GestureDetector(
                //                         //         onTap: () {
                //                         //           model.delLength(index);
                //                         //         },
                //                         //         child: const Icon(
                //                         //           Icons.remove_circle_outline,
                //                         //           color: Colors.red,
                //                         //         ),
                //                         //       )
                //                       ],
                //                     );
                //                   }),
                //                 ),
                //                 SizedBox(
                //                   height: 16.h,
                //                 ),
                //                 GestureDetector(
                //                   onTap: () {
                //                     setState(() {
                //                       model.addLength(newChargeIndex);
                //                     });
                //                   },
                //                   child: DottedBorder(
                //                     color: EV_Colors.yellowbtncolor,
                //                     radius: const Radius.circular(10),
                //                     child: Container(
                //                         alignment: Alignment.center,
                //                         height: 45.h,
                //                         width: double.infinity,
                //                         decoration: const BoxDecoration(
                //                           color: Colors.white,
                //                         ),
                //                         child: const Text(
                //                           "+ ເພີ່ມປະເພດຫົວສາກ",
                //                           style: TextStyle(
                //                             color: EV_Colors.yellowbtncolor,
                //                           ),
                //                         )),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         )
                //       ],
                //     );
                //   }),
                // ),

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
                                  image: NetworkImage("${model.imageStation}"),
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
                                    ],
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
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                          controller: model.namePlace,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          onChanged: (val) {
                            // model?.namePlace.text = val;
                            print(model.namePlace.text);
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
                        Column(
                          children: List.generate(
                              model.facilities.length, (index) {
                            return Column(
                              children: [
                                Row(children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: model.facilities[index],
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: Colors.grey,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                      ),
                                    ),
                                  ),
                                  model.facilities.length == 1
                                      ? const SizedBox()
                                      : GestureDetector(
                                    onTap: () {
                                      model.delFacilities(index);
                                    },
                                    child: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                    ),
                                  )
                                ]),
                                const SizedBox(height: 10),
                              ],
                            );
                          }),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            model.addFacilities();
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
  @override
  void dispose() {
    final info = context.read<UpdateInfoProvider>();

    info.containersList.clear();
    info.facilities.clear();
    info.namePlace.text = '';
    info.nameCpn.text = '';
    info.setImageStation(null);
    info.setImageCpn(null);
    super.dispose();
  }

  ElevatedButton _countBtn(String? title, VoidCallback onPress) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll<Color>(EV_Colors.yellowbtncolor)),
      onPressed: onPress,
      child: Text(title!,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
