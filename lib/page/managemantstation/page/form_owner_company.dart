// ignore_for_file: must_be_immutable

import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/provider/info_company_provider.dart';
import 'package:ev_charging/page/managemantstation/service/pick_image.dart';
import 'package:ev_charging/utils/select_image_or_camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class OwnerCompany extends StatefulWidget {
  TextEditingController namecompany;

  OwnerCompany({
    super.key,
    required this.namecompany,
  });

  @override
  State<OwnerCompany> createState() => _OwnerCompanyState();
}

class _OwnerCompanyState extends State<OwnerCompany> {
  // void ios(InfoCompanyProvider model) {
  //   showCupertinoModalPopup(
  //       context: context,
  //       builder: (cnt) {
  //         return CupertinoActionSheet(
  //           actions: [
  //             CupertinoActionSheetAction(
  //               onPressed: () async {
  //                 Navigator.pop(context);
  //                 await PickImage.onOpenFile(ImageSource.camera, context)
  //                     .then((value) {
  //                   setState(() {
  //                     model.setImageName(value!.imageKey);
  //                     model.setImageUrl(value.urlImage);
  //                   });
  //                 });
  //               },
  //               child: const Text(
  //                 "ເປີດກ້ອງ",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //             CupertinoActionSheetAction(
  //               onPressed: () async {
  //                 Navigator.pop(context);
  //                 await PickImage.onOpenFile(ImageSource.gallery, context)
  //                     .then((value) {
  //                   setState(() {
  //                     model.setImageName(value!.imageKey);
  //                     model.setImageUrl(value.urlImage);
  //                   });
  //                 });
  //               },
  //               child: const Text(
  //                 "ບ່ອນເກັບຮູບພາບ",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             )
  //           ],
  //           cancelButton: CupertinoActionSheetAction(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: const Text('ຍົກເລີກ', style: TextStyle(color: Colors.red)),
  //           ),
  //         );
  //       });
  // }
  //
  // void android(InfoCompanyProvider model) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //         // <-- SEE HERE
  //         borderRadius: BorderRadius.vertical(
  //       top: Radius.circular(25.0),
  //     )),
  //     builder: (BuildContext cont) {
  //       return SizedBox(
  //         height: 150.h,
  //         child: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               ListTile(
  //                 leading: const Icon(Icons.camera),
  //                 title: const Text(
  //                   'ເປີດກ້ອງຖ່າຍຮູບ',
  //                   style: TextStyle(color: Colors.black),
  //                 ),
  //                 onTap: () async {
  //                   Navigator.pop(context);
  //                   await PickImage.onOpenFile(ImageSource.camera, context)
  //                       .then((value) {
  //                     setState(() {
  //                       model.setImageName(value!.imageKey);
  //                       model.setImageUrl(value.urlImage);
  //                     });
  //                   });
  //                 },
  //               ),
  //               ListTile(
  //                 leading: const Icon(Icons.image),
  //                 title: const Text(
  //                   'ບ່ອນເກັບຮູບ',
  //                   style: TextStyle(color: Colors.black),
  //                 ),
  //                 onTap: () async {
  //                   Navigator.pop(context);
  //                   await PickImage.onOpenFile(ImageSource.gallery, context)
  //                       .then((value) {
  //                     setState(() {
  //                       model.setImageName(value!.imageKey);
  //                       model.setImageUrl(value.urlImage);
  //                     });
  //                   });
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<InfoCompanyProvider>(
      builder: (context, models, child) {
        return Container(
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
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                TextFormField(
                  onChanged: (value) {
                    models.setNamcompany(value);
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.grey,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "ກາລຸນາປ້ອນຊື່ບໍລິສັດ";
                    }
                    return null;
                  },
                  controller: widget.namecompany,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "ປ້ອນຊື່ບໍລິສັດ",
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  "ໂລໂກ້ບໍລິສັດ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
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
                              SelectImage().selectImage(context,
                                  ///open gallery
                                  () async {
                                Navigator.pop(context);
                                await PickImage.onOpenFile(
                                        ImageSource.gallery, context)
                                    .then((value) {
                                  setState(() {
                                    models.setImageName(value!.imageKey);
                                    models.setImageUrl(value.urlImage);
                                  });
                                });
                              },
                                /// open camera
                                    () async {
                                  Navigator.pop(context);
                                  await PickImage.onOpenFile(
                                      ImageSource.camera, context)
                                      .then((value) {
                                    setState(() {
                                      models.setImageName(value!.imageKey);
                                      models.setImageUrl(value.urlImage);
                                    });
                                  });
                                },
                              );
                          },
                          child: Container(
                              height: 100.h,
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
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
        );
      },
    );
  }
}
