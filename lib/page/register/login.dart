import 'package:ev_charging/page/register/button.dart';
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
                  margin: EdgeInsets.only(top: 50),
                  child: CircleAvatar(
                    radius: 70,
                    child: Image.asset(
                      "images/logo_ev.png",
                      height: 100.h,
                      width: 100.w,
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Lao Charging Station",
                ),
              ),
              TextFormGlobal(
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
                validator: (value) {
                  if (value == null) {
                    return "ກາລຸນາປ້ອນລະຫັດຜ່ານ";
                  }
                  return null;
                },
                controller: pwd,
                text: "ລະຫັດຜ່ານ",
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                onTap: () {
                  print("email:$email, password:$pwd");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
