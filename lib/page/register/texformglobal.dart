import 'package:ev_charging/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormGlobal extends StatelessWidget {
   TextFormGlobal({Key? key, required this.controller, required this.text, required this.validator}):super(key: key);
  final TextEditingController controller;
   String text;
   FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      padding: const EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
        color: EV_Colors.whitecolor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          hintStyle: TextStyle(height: 1,)
        ),
      ),
    );
  }
}
