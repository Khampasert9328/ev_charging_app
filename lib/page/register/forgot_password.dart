import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/service/auth/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "ລືມລະຫັດຜ່ານ",
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
                controller: email,
                cursorColor: Colors.grey,
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "ກາລຸນາໃສ່ອີເມລໃຫ້ຄົບ";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    FontAwesomeIcons.envelope,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "ປ້ອນອີເມລຂອງທ່ານ:",
                  
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    forgotpassword(email.text, context);
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
                    "ສົ່ງອີເມລ",
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
