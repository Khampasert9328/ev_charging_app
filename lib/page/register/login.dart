import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/register/forgot_password.dart';
import 'package:ev_charging/service/auth/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? email = TextEditingController();
  TextEditingController? pwd = TextEditingController();
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
                loginservice(email!.text, pwd!.text, context);
              } catch (e) {
                rethrow;
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          reverse: true,
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
                        keyboardType: TextInputType.emailAddress,
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
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Icon(Icons.email_outlined),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "ອີເມລ",
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.grey,
                        obscureText: pwdOpen,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "ກາລຸນາໃສ່ລະຫັດຜ່ານໃຫ້ຄົບ";
                          }
                          return null;
                        },
                        controller: pwd,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                pwdOpen = !pwdOpen;
                              });
                            },
                            child: pwdOpen
                                ? const Icon(FontAwesomeIcons.eyeSlash)
                                : const Icon(
                                    FontAwesomeIcons.eye,
                                  ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "ລະຫັດຜ່ານ",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ForgotPassword()));
                        },
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

              Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ),
      ),
    );
  }
}
