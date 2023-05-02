import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/onboardingscreen/onboardingsreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: "Lao Charging Station",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "NotoSan",
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: EV_Colors.greencolor,
              secondary: EV_Colors.greycolor,
            ),
          ),
          home: OnboardingScreen(),
        );
      },
    );
  }
}
