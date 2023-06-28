import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectImageAndroid{
  static Future<void> selectImageAndroid(context, VoidCallback openCamera, VoidCallback openGallery) async{
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          )),
      builder: (BuildContext cont) {
        return SizedBox(
          height: 150.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text(
                    'ເປີດກ້ອງຖ່າຍຮູບ',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: openCamera,
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text(
                    'ບ່ອນເກັບຮູບ',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: openGallery,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}