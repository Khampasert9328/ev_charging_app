import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/page/textformfield/textform.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:ev_charging/page/managemantstation/service/pick_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class InfoContainnaer extends StatefulWidget {
  const InfoContainnaer({super.key});

  @override
  State<InfoContainnaer> createState() => _InfoContainnaerState();
}

class _InfoContainnaerState extends State<InfoContainnaer> {
  List item = [
    "1",
    "2",
    "3",
    "4",
  ];
  // int length = 1;
  int lengthdropdown = 1;
  List itemtype = [
    "ຫົວສາກ A",
    "ຫົວສາກ B",
    "ຫົວສາກ C",
    "ຫົວສາກ D",
  ];

  String? valueitemtype;

  String? valueitem;
  // List<TextEditingController>? brand;

  // final _model = TextEditingController();
  // Map<String, String>? map = {
  //   "brand" : "",
  //   "model" : "",
  // };

  // List<EvChargingFormModel>? evModels;
  List evModels = [];

  @override
  void initState() {
    context.read<InfoContainerProvider>().getBrandTextCtr();
    context.read<InfoContainerProvider>().getGenTextCtr();
    context.read<InfoContainerProvider>().getModelTextCtr();
    // for(int i = 0; i < context.read<InfoContainerProvider>().count ; i++){
    //   brand?.add(TextEditingController());
    //   generation?.add(TextEditingController());
    //   model?.add(TextEditingController());
    // }
    super.initState();
  }

  void ios(InfoContainerProvider model) {
    showCupertinoModalPopup(
        context: context,
        builder: (cnt) {
          return CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  await PickImage.onOpenFile(ImageSource.camera, context).then((value) {
                    setState(() {
                      model.setImageName(value!.imageKey);
                      model.setImageUrl(value.urlImage);
                    });
                  });
                },
                child: const Text(
                  "ເປີດກ້ອງ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  await PickImage.onOpenFile(ImageSource.gallery, context).then((value) {
                    setState(() {
                      model.setImageName(value!.imageKey);
                      model.setImageUrl(value.urlImage);
                    });
                  });
                },
                child: const Text(
                  "ບ່ອນເກັບຮູບພາບ",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ຍົກເລີກ', style: TextStyle(color: Colors.red)),
            ),
          );
        });
  }

  void android(InfoContainerProvider model) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      )),
      builder: (BuildContext cont) {
        return SizedBox(
          height: 150.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text(
                    'ເປີດກ້ອງຖ່າຍຮູບ',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    await PickImage.onOpenFile(ImageSource.camera, context).then((value) {
                      setState(() {
                        model.setImageName(value!.imageKey);
                        model.setImageUrl(value.urlImage);
                      });
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text(
                    'ບ່ອນເກັບຮູບ',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    await PickImage.onOpenFile(ImageSource.gallery, context).then((value) {
                      setState(() {
                        model.setImageName(value!.imageKey);
                        model.setImageUrl(value.urlImage);
                      });
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                            Text(models.count.toString()),
                            Spacer(),
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      models.increment();
                                      // models.getBrandTextCtr();
                                    },
                                    child: Text("+")),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                    onPressed: () {
                                      models.brand.removeAt(models.count - 1);
                                      models.model.removeAt(models.count - 1);
                                      models.generation.removeAt(models.count - 1);
                                      models.lopTu();
                                    },
                                    child: Text("-")),
                              ],
                            )
                          ],
                        )

                        // DropdownButton(
                        //     isExpanded: true,
                        //     underline: const SizedBox(),
                        //     hint: const Text('ເພີ່ມຈຳນວນຕູ້ສາກ'),
                        //     value: valueitem,
                        //     items: item.map((e) {
                        //       return DropdownMenuItem<String>(value: e, child: Text(e.toString()));
                        //     }).toList(),
                        //     onChanged: (String? value) {
                        //         valueitem = value.toString();
                        //         length = int.parse(value.toString());
                        //         models.number = length;
                        //     }),
                        ),
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
                itemCount: models.count,
                itemBuilder: (context, inde) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ຕູ້ທີ ${item[inde]}",
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
                                ontap: (value) {
                                  // brand?[index].text = value;
                                },
                                text: "ປ້ອນຊື່ຍີ່ຫໍ້",
                                controller: models.brand[inde],
                                onchange: () {
                                  // models.bra = brand?[index].text;
                                  //models.brand.add(value!);
                                },
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
                              TextFormInfo(
                                ontap: (value) {
                                  // generation?[index].text = value;
                                },
                                text: "ປ້ອນຊື່ລຸ້ນ",
                                controller: models.generation[inde],
                                onchange: () {
                                  // models.addGen = generation?[index].text;
                                },
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
                                ontap: (value) {
                                  // model?[index]?.text = value;
                                },
                                text: "ປ້ອນຊື່ໂມເດລ",
                                controller: models.model[inde],
                                onchange: () {
                                  // models.addModel = model?[index]?.text;
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
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: models.lengthDropdown,
                                  itemBuilder: (context, index) {
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
                                                hint: const Text('ເລືອກປະເພດຫົວສາກ'),
                                                value: models.chargeType.isEmpty
                                                    ? valueitemtype
                                                    : models.chargeType[index],
                                                items: itemtype.map((e) {
                                                  return DropdownMenuItem(value: e, child: Text(e));
                                                }).toList(),
                                                onChanged: (value) {
                                                  if (models.chargeType.isEmpty) {
                                                    models.addChargeType(value.toString());
                                                  } else {
                                                    models.chargeType[index] = value.toString();
                                                  }
                                                  setState(() {
                                                    valueitemtype = value.toString();
                                                    models.chargeType[inde] = value.toString();
                                                  });
                                                }),
                                          ),
                                        ),
                                        models.lengthDropdown == 1
                                            ? const SizedBox()
                                            : GestureDetector(
                                                onTap: () {
                                                  models.delLength();
                                                  models.chargeType.removeAt(models.lengthDropdown - 1);
                                                },
                                                child: const Icon(
                                                  Icons.remove_circle_outline,
                                                  color: Colors.red,
                                                ),
                                              )
                                      ],
                                    );
                                  }),
                              SizedBox(
                                height: 16.h,
                              ),
                              models.lengthDropdown == 2
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        models.addLength();
                                        models.addChargeType(itemtype.first);
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
                      "ຮູບພາບສະຖານທີ່",
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
                                if (Platform.isIOS) {
                                  ios(models);
                                } else if (Platform.isAndroid) {
                                  android(models);
                                }
                              },
                              child: Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(color: Colors.grey[200]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      const Text("ອັບໂຫຼດຮູບພາບ")
                                    ],
                                  )),
                            ),
                          )
                        : Image.network(models.imageUrl!, fit: BoxFit.fill)
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
