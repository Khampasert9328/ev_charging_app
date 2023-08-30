


import 'package:dotted_border/dotted_border.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/constant/data.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../utils/select_image_or_camera.dart';
import '../service/pick_image.dart';

class InfoContainnaer extends StatefulWidget {
  const InfoContainnaer({super.key});

  @override
  State<InfoContainnaer> createState() => _InfoContainnaerState();
}

class _InfoContainnaerState extends State<InfoContainnaer> {
  // List<Map<String, dynamic>> listData = [];
  // final container = EvChargingFormModel();
  // final charge = Constainner();

  List<List<Map<String, dynamic>>> map = [[]];

  List item = [
    "1",
    "2",
    "3",
    "4",
  ];

  // int length = 1;
  int lengthdropdown = 1;

  String? valueitemtype;

  String? valueitem;

  List evModels = [];
  int selectindex = 0;

  List<Widget> dropdown = [];

  @override
  void initState() {
    context.read<InfoContainerProvider>().getBrandTextCtr();
    context.read<InfoContainerProvider>().getGenTextCtr();
    context.read<InfoContainerProvider>().getModelTextCtr();
    // for(int i = 0; i < context.read<InfoContainerProvider>().count ; i++){
    //   brand?.add(TextEditingController());
    //   generation?.add(TextEditingController());
    //   model?.add(TextEditingController());
    // data.add({
    //   "type_charge" : []
    // });
    // data.add({"type_charge": ListModel(datas: [])});
    super.initState();
  }

  int indexCon = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoContainerProvider>(builder: (_, models, child) {
      return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      translation(context).amount,
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
                            Text(models.containersList.length.toString()),
                            Spacer(),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll<Color>(EV_Colors.yellowbtncolor)),
                                  onPressed: () {
                                    models.increment();
                                  },
                                  child: Text(
                                    translation(context).add,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll<Color>(EV_Colors.yellowbtncolor)),
                                    onPressed: () {
                                      if (models.containersList.length > 1) {
                                        models.brand.removeAt(models.containersList.length - 1);
                                        models.model.removeAt(models.containersList.length - 1);
                                        models.generation.removeAt(models.containersList.length - 1);
                                        // data.removeAt(models.count-1);
                                        models.lopTu();
                                      }
                                    },
                                    child: Text(
                                      translation(context).delete,
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                itemCount: models.containersList.length,
                // itemCount: models.evModel?.length,
                itemBuilder: (context, index1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${translation(context).containnerchange} ${item[index1]}",
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
                                translation(context).branch,
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
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "ກາລຸນາປ້ອນຍີ່ຫໍ້";
                                  }
                                  return null;
                                },
                                controller: models.brand[index1],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: translation(context).branch,
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Text(
                                translation(context).generation,
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
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "ກາລຸນາປ້ອນຍີ່ຫໍ້";
                                  }
                                  return null;
                                },
                                controller: models.generation[index1],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: translation(context).generation,
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Text(
                                translation(context).models,
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
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "ກາລຸນາປ້ອນໂມເດລ";
                                  }
                                  return null;
                                },
                                controller: models.model[index1],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: translation(context).models,
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Text(
                                translation(context).addchargetype,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Column(
                                children:
                                    List.generate(models.containersList[index1].typeChargingList.length, (index2) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey[200],
                                          ),
                                          child: DropdownButton(
                                              isExpanded: true,
                                              underline: const SizedBox(),
                                              hint: Text(translation(context).choosechargetype),
                                              value:
                                                  models.containersList[index1].typeChargingList[index2].typeCharging,
                                              items: AppData.typeChargeItem.map((e) {
                                                return DropdownMenuItem(value: e, child: Text(e));
                                              }).toList(),
                                              onChanged: (value) {
                                                models.dropDown(index1, index2, value.toString());
                                              }),
                                        ),
                                      ),
                                      models.containersList[index1].typeChargingList.length == 1
                                          ? const SizedBox()
                                          : GestureDetector(
                                              onTap: () {
                                                models.delLength(index1);
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
                              models.containersList[index1].typeChargingList.length == 2
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        models.addLength(index1);
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
                                            child: Text(
                                              translation(context).addchargetype,
                                              style: TextStyle(
                                                color: EV_Colors.yellowbtncolor,
                                              ),
                                            )),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
            SizedBox(
              height: 10.h,
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
                      translation(context).imageplace,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    models.imageUrl == null
                        ? Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                 {
                                  SelectImage().selectImage(
                                    context,

                                    ///open gallery
                                    () async {
                                      Navigator.pop(context);
                                      await PickImage.onOpenFile(ImageSource.gallery, context).then((value) {
                                        setState(() {
                                          models.setImageName(value!.imageKey);
                                          models.setImageUrl(value.urlImage);
                                        });
                                      });
                                    },
                                    /// open camera
                                    () async {
                                      Navigator.pop(context);
                                      await PickImage.onOpenFile(ImageSource.camera, context).then((value) {
                                        setState(() {
                                          models.setImageName(value!.imageKey);
                                          models.setImageUrl(value.urlImage);
                                        });
                                      });
                                    },
                                  );
                                }
                              },
                              child: Container(
                                height: 70.h,
                                decoration: BoxDecoration(color: Colors.grey[200]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(translation(context).uploadimage)
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Image.network(models.imageUrl!, fit: BoxFit.fill),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
