import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/main.dart';
import 'package:ev_charging/page/settings/changepassword.dart';
import 'package:ev_charging/utils/translate/language.dart';
import 'package:ev_charging/utils/translate/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? token;
  // @override
  // void initState() {
  //   PreFer().getToken().then((value) async {
  //     Map<String, dynamic> playload = Jwt.parseJwt(value!);
  //   String? addmin = playload["id"];
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //final providerService = Provider.of<SetLangugesProvider>(context, listen: false);

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
        title: Text(
          translation(context).setting,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.language,
                color: EV_Colors.yellowbtncolor,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translation(context).changelanguage,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: DropdownButton<Language>(
                        underline: const SizedBox(),
                        hint: Text(
                          translation(context).chooselanguage,
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: Language.languagelist()
                            .map<DropdownMenuItem<Language>>(
                              (e) => DropdownMenuItem<Language>(
                                value: e,
                                child: Row(
                                  children: [
                                    Text(
                                      e.flag,
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Text(e.name)
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (language) async {
                          if (language != null) {
                            Locale locale = await setLocale(language.languageCode!);
                            MyApp.setLocale(context, Locale(locale.toString()));
                          }
                        }),
                  ),
                ],
              ),
            ),
            token == null
                ? const SizedBox()
                : ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ChangePassword()));
                    },
                    leading: const Icon(
                      Icons.lock_outline,
                      color: EV_Colors.yellowbtncolor,
                    ),
                    title: Text(
                      "ປ່ຽນລະຫັດຜ່ານ",
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
