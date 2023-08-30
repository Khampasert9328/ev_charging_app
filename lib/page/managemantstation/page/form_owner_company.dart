// ignore_for_file: must_be_immutable

import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/provider/info_company_provider.dart';
import 'package:ev_charging/page/managemantstation/service/pick_image.dart';
import 'package:ev_charging/utils/select_image_or_camera.dart';
import 'package:flutter/material.dart';
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
