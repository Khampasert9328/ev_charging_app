import 'package:dotted_border/dotted_border.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/page/textformfield/textform.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InfoContainnaer extends StatefulWidget {
  const InfoContainnaer({super.key});

  @override
  State<InfoContainnaer> createState() => _InfoContainnaerState();
}

class _InfoContainnaerState extends State<InfoContainnaer> {
  List item = [
    "1",
    "2",
    "3",
    "4",
  ];
  int length = 1;
  int lengthdropdown = 1;
  List itemtype = [
    "ຫົວສາກ A",
    "ຫົວສາກ B",
    "ຫົວສາກ C",
    "ຫົວສາກ D",
  ];

  String? valueitemtype;

  String? valueitem;
  List<TextEditingController>? brand;
  List<TextEditingController>? generation;
  List<TextEditingController?>? model;

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoContainerProvider>(builder: (_, models, child) {
      return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                            return DropdownMenuItem<String>(value: e, child: Text(e.toString()));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              valueitem = value.toString();
                              length = int.parse(value.toString());
                              models.number = length;
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
                              TextFormInfo(
                                ontap: (value) {},
                                text: "ປ້ອນຊື່ຍີ່ຫໍ້",
                                controller: brand?[index],
                                onchange: () {
                                  for (var i in brand!) {
                                    models.listContainner = i as List<String>;
                                  }
                                },
                              ),
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
                              TextFormInfo(
                                ontap: (value) {},
                                text: "ປ້ອນຊື່ລຸ້ນ",
                                controller: generation?[index],
                                onchange: () {},
                              ),
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
                              TextFormInfo(
                                ontap: (value) {
                                  model?[index]?.text = value;
                                },
                                text: "ປ້ອນຊື່ໂມເດລ",
                                controller: model?[index],
                                onchange: () {},
                              ),
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
                                            margin: EdgeInsets.only(bottom: 10),
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey[200],
                                            ),
                                            child: DropdownButton(
                                                isExpanded: true,
                                                underline: const SizedBox(),
                                                hint: const Text('ເລືອກປະເພດຫົວສາກ'),
                                                value: valueitemtype,
                                                items: itemtype.map((e) {
                                                  return DropdownMenuItem(value: e, child: Text(e));
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    valueitemtype = value as String?;
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
              height: 10.h,
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
                      "ຮູບພາບສະຖານທີ່",
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
                      child: Container(
                        height: 70.h,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text("ອັບໂຫຼດຮູບພາບ")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
