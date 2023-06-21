import 'package:dotted_border/dotted_border.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'textformfield/textform.dart';

class InfoLocationStation extends StatefulWidget {
  const InfoLocationStation({super.key});

  @override
  State<InfoLocationStation> createState() => _InfoLocationStationState();
}

class _InfoLocationStationState extends State<InfoLocationStation> {
   TextEditingController nameplace =TextEditingController();
   TextEditingController nameplacilitie = TextEditingController();
  String? valueitem;
  int lengthtext = 1;
  List province = [
    "ຫົວສາກ A",
    "ຫົວສາກ B",
    "ຫົວສາກ C",
    "ຫົວສາກ D",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: EV_Colors.whitecolor,
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                color: Colors.black.withOpacity(0.1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ແຂວງ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text('ເລືອກແຂວງ'),
                      value: valueitem,
                      items: province.map((e) {
                        return DropdownMenuItem<String>(
                            value: e, child: Text(e.toString()));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          valueitem = value.toString();
                        });
                      }),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "ເມືອງ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text('ເລືອກເມືອງ'),
                      value: valueitem,
                      items: province.map((e) {
                        return DropdownMenuItem<String>(
                            value: e, child: Text(e.toString()));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          valueitem = value.toString();
                        });
                      }),
                ),
                Text(
                  "ບ້ານ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text('ເລືອກບ້ານ'),
                      value: valueitem,
                      items: province.map((e) {
                        return DropdownMenuItem<String>(
                            value: e, child: Text(e.toString()));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          valueitem = value.toString();
                        });
                      }),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "ຊື່ສະຖານທີ່",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                TextFormInfo(text: "ປ້ອນຊື່ສະຖານທີ່",controller: nameplace,onchange: () {},ontap: (value) {
                                  
                                },),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: EV_Colors.whitecolor,
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                color: Colors.black.withOpacity(0.1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ສິ່ງອຳນວຍຄວາມສະດວກ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: lengthtext,
                    itemBuilder: (context, index) {
                      return Row(children: [
                        Expanded(
                          child:
                              TextFormInfo(text: "ຕົວຢ່າງ: ຮ້ານ Amazon cafe",controller: nameplacilitie,onchange: () {
                                
                              },ontap: (value) {
                                  
                                },),
                        ),
                        lengthtext == 1
                            ? SizedBox()
                            : GestureDetector(
                              onTap: (){
                                setState(() {
                                  lengthtext -=1;
                                });
                              },
                              child: const Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.red,
                                ),
                            )
                      ]);
                    }),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      lengthtext += 1;
                    });
                  },
                  child: DottedBorder(
                    color: EV_Colors.yellowbtncolor,
                    radius: Radius.circular(10),
                    child: Container(
                        alignment: Alignment.center,
                        height: 45.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Text(
                          "+ ເພີ່ມສະຖານທີ່",
                          style: TextStyle(
                            color: EV_Colors.yellowbtncolor,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
