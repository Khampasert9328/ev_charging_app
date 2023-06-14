// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerCompany extends StatefulWidget {
  TextEditingController namecompany;
  String selectedImagePath;
  OwnerCompany({super.key, required this.namecompany, required this.selectedImagePath});

  @override
  State<OwnerCompany> createState() => _OwnerCompanyState();
}

class _OwnerCompanyState extends State<OwnerCompany> {
  @override
  Widget build(BuildContext context) {
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
                border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
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
            widget.selectedImagePath == ""
                ? Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        selectImage();
                        setState(() {});
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
                : Image.file(
                    File(widget.selectedImagePath),
                    height: 200,
                    width: double.infinity,
                  ),
          ],
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'ເລືອກຮູບພາບ',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: const Column(
                            children: [
                              Icon(
                                Icons.photo_outlined,
                                size: 60,
                              ),
                              Text('ບ່ອນເກັບຮູບພາບ'),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: const Column(
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                size: 60,
                              ),
                              Text('ເປີດກ້ອງ'),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
