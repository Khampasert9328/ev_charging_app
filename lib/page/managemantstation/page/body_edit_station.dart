import 'package:dotted_border/dotted_border.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/page/textformfield/textform.dart';
import 'package:ev_charging/widget/dialog/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyEditStation extends StatefulWidget {
  const BodyEditStation({super.key});

  @override
  State<BodyEditStation> createState() => _BodyEditStationState();
}

class _BodyEditStationState extends State<BodyEditStation> {
  List item = [
    "1",
    "2",
    "3",
    "4",
  ];
  List itemtype = [
    "ຫົວສາກ A",
    "ຫົວສາກ B",
    "ຫົວສາກ C",
    "ຫົວສາກ D",
  ];

  List province = [
    "ຫົວສາກ A",
    "ຫົວສາກ B",
    "ຫົວສາກ C",
    "ຫົວສາກ D",
  ];

  String? valueitemtype;
  String? valueitem;
  int length = 1;
  int lengthdropdown = 1;
  int lengthtext = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          EVDialog()
              .showDialogSuccess(context, "ແຈ້ງເຕືອນ", "ແກ້ໄຂຂໍ້ມູນສຳເລັດແລ້ວ",(){});
        },
        child: Container(
          margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
          alignment: Alignment.center,
          height: 46.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: EV_Colors.yellowbtncolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "ບັນທຶກຂໍ້ມູນ",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: EV_Colors.whitecolor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ຂໍ້ມູນເຈົ້າຂອງ",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 9.h,
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
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ບໍລິສັດ",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      TextFormInfo(text: "ບໍລິສັດ ໂລກ້າ ຈຳກັດ"),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "ໂລໂກ້ບໍລິສັດ",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 210.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/image1.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    EV_Colors.whitecolor.withOpacity(0.2),
                                    EV_Colors.yellowbtncolor
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.image,
                                color: EV_Colors.whitecolor,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Text(
                                "ແກ້ໄຂຮູບພາບ",
                                style: TextStyle(
                                  color: EV_Colors.whitecolor,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(
                "ຂໍ້ມູນຕູ້ສາກ",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                        "ຈຳນວນຕູ້ສາກ",
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
                            hint: const Text('ເພີ່ມຈຳນວນຕູ້ສາກ'),
                            value: valueitem,
                            items: item.map((e) {
                              return DropdownMenuItem<String>(
                                  value: e, child: Text(e.toString()));
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                valueitem = value.toString();
                                length = int.parse(value.toString());
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ຕູ້ທີ ${item[index]}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
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
                                  "ຍີ່ຫໍ້",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                TextFormInfo(text: "ປ້ອນຊື່ຍີ່ຫໍ້"),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                  "ລຸ້ນ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                TextFormInfo(text: "ປ້ອນຊື່ລຸ້ນ"),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                  "ໂມເດລ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                TextFormInfo(text: "ປ້ອນຊື່ໂມເດລ"),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                  "ປະເພດຫົວສາກ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: lengthdropdown,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey[200],
                                              ),
                                              child: DropdownButton(
                                                  isExpanded: true,
                                                  underline: const SizedBox(),
                                                  hint: const Text(
                                                      'ເລືອກປະເພດຫົວສາກ'),
                                                  value: valueitemtype,
                                                  items: itemtype.map((e) {
                                                    return DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e));
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      valueitemtype =
                                                          value as String?;
                                                    });
                                                  }),
                                            ),
                                          ),
                                          lengthdropdown == 1
                                              ? const SizedBox()
                                              : GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      lengthdropdown -= 1;
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.remove_circle_outline,
                                                    color: Colors.red,
                                                  ),
                                                )
                                        ],
                                      );
                                    }),
                                SizedBox(
                                  height: 16.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      lengthdropdown += 1;
                                    });
                                  },
                                  child: DottedBorder(
                                    color: EV_Colors.yellowbtncolor,
                                    radius: const Radius.circular(10),
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 45.h,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: const Text(
                                          "+ ເພີ່ມປະເພດຫົວສາກ",
                                          style: TextStyle(
                                            color: EV_Colors.yellowbtncolor,
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: 15.h,
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
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ຮູບພາບສະຖານທີ່",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 210.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/image1.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    EV_Colors.whitecolor.withOpacity(0.2),
                                    EV_Colors.yellowbtncolor
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.image,
                                color: EV_Colors.whitecolor,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Text(
                                "ແກ້ໄຂຮູບພາບ",
                                style: TextStyle(
                                  color: EV_Colors.whitecolor,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(
                "ຂໍ້ມູນສະຖານທີ່",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.h,
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
                      TextFormInfo(text: "ປ້ອນຊື່ສະຖານທີ່"),
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
                                child: TextFormInfo(
                                    text: "ຕົວຢ່າງ: ຮ້ານ Amazon cafe"),
                              ),
                              lengthtext == 1
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          lengthtext -= 1;
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
          ),
        ),
      ),
    );
  }
}
