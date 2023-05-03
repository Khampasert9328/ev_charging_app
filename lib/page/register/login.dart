import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/register/texformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Image.asset(
                    "images/logo.png",
                    height: 200.h,
                    width: 300.w,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    color: EV_Colors.whitecolor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          TextFormGlobal(
                            obscureText: false,
                            controller: email,
                            text: "ອີເມລ",
                            validator: (value) {
                              if (value == null) {
                                return "ກາລຸນາປ້ອນອີເມລ";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormGlobal(
                            obscureText: true,
                            validator: (value) {
                              if (value == null) {
                                return "ກາລຸນາປ້ອນລະຫັດຜ່ານ";
                              }
                              return null;
                            },
                            controller: pwd,
                            text: "ລະຫັດຜ່ານ",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text("ລຶມລະຫັດຜ່ານ"),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                           
                              if (_key.currentState!.validate()) {}
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: EV_Colors.greencolor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "ເຂົ້າສູ່ລະບົບ",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: EV_Colors.whitecolor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
