import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/page/textformfield/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () async {},
        child: Container(
          margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
          alignment: Alignment.center,
          height: 46.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: EV_Colors.yellowbtncolor,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "ບັນທຶກລະຫັດຜ່ານໃໝ່",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: EV_Colors.whitecolor,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "ປ່ຽນລະຫັດຜ່ານ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Center(
                  child: Image.asset(
                    "images/MEM.png",
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "ລະຫັດຜ່ານປັດຈຸບັນ:",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              TextFormInfo(text: "ປ້ອນລະຫັດຜ່ານປັດຈຸບັນ"),
              Text(
                "ລະຫັດຜ່ານໃໝ່:",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              const TextFormInfo(text: "ປ້ອນລະຫັດຜ່ານໃໝ່"),
              Text(
                "ຢືນຢັນລະຫັດຜ່ານໃໝ່:",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              const TextFormInfo(text: "ປ້ອນການຢືນຢັນລະຫັດຜ່ານໃໝ່"),
            ],
          ),
        ),
      ),
    );
  }
}
