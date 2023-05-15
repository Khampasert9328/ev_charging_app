import 'package:ev_charging/busines%20logic/auth_provider.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/constant/prefer.dart';
import 'package:ev_charging/page/home/homemaps.dart';
import 'package:ev_charging/page/register/texformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? email = TextEditingController();
  TextEditingController? pwd = TextEditingController();
  bool check = false;
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
          "ເຂົ້າສູ່ລະບົບ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            if (_key.currentState!.validate()) {
              try {
                AuthProvider()
                    .loginprovider(email!.text, pwd!.text, context)
                    .then((value) async{
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeMaps()),
                      (route) => false);

                     
                });
              } catch (e) {
                print("error===$e");
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: EV_Colors.yellowbtncolor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "ເຂົ້າສູ່ລະບົບ",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: EV_Colors.whitecolor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.grey,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "ກາລຸນາໃສ່ອີເມລໃຫ້ຄົບ";
                          }
                          return null;
                        },
                        controller: email,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "ອີເມລ",
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        cursorColor: Colors.grey,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "ກາລຸນາໃສ່ລະຫັດຜ່ານໃຫ້ຄົບ";
                          }
                          return null;
                        },
                        controller: pwd,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "ລະຫັດຜ່ານ",
                          border: InputBorder.none,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "ລືມລະຫັດຜ່ານ?",
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                      ),
                    ],
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
