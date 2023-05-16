import 'package:ev_charging/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class EVDialog {
  Future<void> showDialogSuccess(
      BuildContext context, String title, String text) {
    return QuickAlert.show(
      context: context,
      title: title,
      type: QuickAlertType.success,
      text: text,
      confirmBtnText: "ຕົກລົງ",
      confirmBtnColor: EV_Colors.yellowbtncolor,
      titleColor: Colors.black,
      textColor: Colors.black,
    );
  }

  Future<void> showDialogLoading(BuildContext context, String title) {
    return QuickAlert.show(
     context: context,
      title: title,
      type: QuickAlertType.loading,
     
      confirmBtnColor: EV_Colors.yellowbtncolor,
      titleColor: Colors.black,
      textColor: Colors.black,
    );
  }

  Future<void> showDiaError(
    BuildContext context,
    String title,
  ) {
    return QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: title,
        confirmBtnText: "ຕົກລົງ");
  }
}
