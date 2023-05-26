import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/service/auth/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController password = TextEditingController();
  bool pwdOpen = true;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Image.asset(
                    "images/MEM.png",
                    height: 200.h,
                    width: 300.w,
                  ),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              TextFormField(
                controller: password,
                cursorColor: Colors.grey,
                obscureText: pwdOpen,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "ກາລຸນາໃສ່ລະຫັດຜ່ານໃໝ່";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        pwdOpen = !pwdOpen;
                      });
                    },
                    child: pwdOpen
                        ? const Icon(
                            Icons.visibility_off_outlined,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                          ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "ປ້ອນລະຫັດຜ່ານ:",
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    changpassword(context, password.text);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: EV_Colors.yellowbtncolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "ປ່ຽນລະຫັດຜ່ານໃໝ່",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: EV_Colors.whitecolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
