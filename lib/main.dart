import 'dart:io';
import 'package:ev_charging/busines%20logic/auth_provider.dart';
import 'package:ev_charging/busines%20logic/infocharg/info_charg_provider.dart';
import 'package:ev_charging/busines%20logic/setlanguge_provider.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/provider/info_company_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/infon_location_provider.dart';
import 'package:ev_charging/page/managemantstation/provider/update_info_provider.dart';
import 'package:ev_charging/page/onboardingscreen/onboardingsreen.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
import 'package:provider/provider.dart';
import 'page/home/provider/getchargebyid_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale newlocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(context, newlocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(context, Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((value) => setLocale(context, value));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProvider()),
            ChangeNotifierProvider(create: (_) => SetLangugesProvider()),
            ChangeNotifierProvider(create: (_) => InfoCompanyProvider()),
            ChangeNotifierProvider(create: (_) => InfoContainerProvider()),
            ChangeNotifierProvider(create: (_) => InfoChargProvider()),
            ChangeNotifierProvider(create: (_) => InfoLocationProvider()),
            ChangeNotifierProvider(create: (_) => GetChargeByIdProvider()),
            ChangeNotifierProvider(create: (_) =>UpdateInfoProvider())
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
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _locale,
            
            home: const OnboardingScreen(),
            // home: const AddStation(),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, host, port) => true;
  }
}
