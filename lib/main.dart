import 'dart:io';
import 'package:ev_charging/busines%20logic/auth_provider.dart';
import 'package:ev_charging/busines%20logic/setlanguge_provider.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/onboardingscreen/onboardingsreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
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
      builder: (context, _) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>AuthProvider()),
            ChangeNotifierProvider(create: (_)=>SetLangugesProvider())
          ],
          child: MaterialApp(
            title: "Lao Charging Station",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "NotoSan",
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: EV_Colors.whitecolor,
                secondary: EV_Colors.greycolor,
              ),
            ),
            home: const OnboardingScreen(),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, host, port) => true;
  }
}
