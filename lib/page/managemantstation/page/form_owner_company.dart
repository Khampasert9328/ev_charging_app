// ignore_for_file: must_be_immutable

import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerCompany extends StatefulWidget {
  TextEditingController namecompany;
 OwnerCompany({super.key, required this.namecompany});

  @override
  State<OwnerCompany> createState() => _OwnerCompanyState();
}


class _OwnerCompanyState extends State<OwnerCompany> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
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
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Container(
                height: 70.h,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
