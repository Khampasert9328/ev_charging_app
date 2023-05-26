import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/settings/changepassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? valueitem;
  String? selectLanguge;
  void onlangugeselect(String languges) {
    setState(() {
      selectLanguge = languges;
    });
  }

  List item = [
    "LA",
    "EN",
  ];
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          "ການຕັ້ງຄ່າ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                    "ປ່ຽນພາສາ",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: DropdownButton(
                        underline: const SizedBox(),
                        hint: const Text('ເລືອກພາສາ'),
                        value: valueitem,
                        items: item.map((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                        onChanged: (value) async {}),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>ChangePassword()));
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
