import 'package:ev_charging/widget/dialog/appimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImage.loading, width: 150, height: 150, frameRate: FrameRate(60)),
    );
  }
}