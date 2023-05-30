import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog extends StatelessWidget {
  final String title;

  const LoadingDialog({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/loading.gif",
              width: 100.w,
              height: 100.h,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
