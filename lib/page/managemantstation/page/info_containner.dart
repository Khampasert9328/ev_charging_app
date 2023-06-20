// ignore_for_file: must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InfoContainnaer extends StatefulWidget {
  TextEditingController brand = TextEditingController();
  List<TextEditingController>? generation;
  TextEditingController model;
  InfoContainnaer({super.key, required this.brand, required this.generation, required this.model});

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
  // int length = 1;
  int lengthdropdown = 1;
  List itemtype = [
    "ຫົວສາກ A",
    "ຫົວສາກ B",
    "ຫົວສາກ C",
    "ຫົວສາກ D",
  ];

  String? valueitemtype;

  String? valueitem;
  // List<TextEditingController>? brand;

  // final _model = TextEditingController();
  // Map<String, String>? map = {
  //   "brand" : "",
  //   "model" : "",
  // };

  // List<EvChargingFormModel>? evModels;
  List evModels = [];

  @override
  void initState() {
    context.read<InfoContainerProvider>().getBrandTextCtr();
    context.read<InfoContainerProvider>().getGenTextCtr();
    context.read<InfoContainerProvider>().getModelTextCtr();
    // for(int i = 0; i < context.read<InfoContainerProvider>().count ; i++){
    //   brand?.add(TextEditingController());
    //   generation?.add(TextEditingController());
    //   model?.add(TextEditingController());
    // }
    super.initState();
  }

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(models.count.toString()),
                          Spacer(),
                          Row(
                            children: [
                              ElevatedButton(
                              onPressed: (){
                                models.increment();
                                // models.getBrandTextCtr();
                              },
                              child: Text("+")),
                              const SizedBox(width: 10),
                              ElevatedButton(onPressed: (){
                              models.brand.removeAt(models.count-1);
                              models.model.removeAt(models.count-1);
                              models.generation.removeAt(models.count-1);
                              models.lopTu();

                              }, child: Text("-")),
                            ],
                          )
                        ],
                      )

                      // DropdownButton(
                      //     isExpanded: true,
                      //     underline: const SizedBox(),
                      //     hint: const Text('ເພີ່ມຈຳນວນຕູ້ສາກ'),
                      //     value: valueitem,
                      //     items: item.map((e) {
                      //       return DropdownMenuItem<String>(value: e, child: Text(e.toString()));
                      //     }).toList(),
                      //     onChanged: (String? value) {
                      //         valueitem = value.toString();
                      //         length = int.parse(value.toString());
                      //         models.number = length;
                      //     }),
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
                itemCount: models.count,
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
                                ontap: (value) {
                                  // brand?[index].text = value;
                                },
                                text: "ປ້ອນຊື່ຍີ່ຫໍ້",
                                controller: models.brand[index],
                                onchange: () {
                                  // models.bra = brand?[index].text;
                                  //models.brand.add(value!);
                                },
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.grey,
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "ກາລຸນາປ້ອນຍີ່ຫໍ້";
                                  }
                                  return null;
                                },
                                controller: widget.brand,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: "ປ້ອນຍີ່ຫໍ້",
                                ),
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
                                ontap: (value) {
                                  // generation?[index].text = value;
                                },
                                text: "ປ້ອນຊື່ລຸ້ນ",
                                controller: models.generation[index],
                                onchange: () {
                                  // models.addGen = generation?[index].text;
                                },
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
                                  // model?[index]?.text = value;
                                },
                                text: "ປ້ອນຊື່ໂມເດລ",
                                controller: models.model[index],
                                onchange: () {
                                  // models.addModel = model?[index]?.text;
                                },
                                controller: widget.model,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: "ປ້ອນໂມເດລ",
                                ),
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
                                  itemCount: models.lengthDropdown,
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
                                                value:
                                                models.chargeType.isEmpty ?
                                                valueitemtype :
                                                models.chargeType[index],
                                                items: itemtype.map((e) {
                                                  return DropdownMenuItem(value: e, child: Text(e));
                                                }).toList(),
                                                onChanged: (value) {
                                                  if(models.chargeType.isEmpty){
                                                    models.addChargeType(value.toString());
                                                  } else{
                                                    models.chargeType[index] = value.toString();
                                                  }
                                                  setState(() {
                                                    valueitemtype = value.toString();
                                                    models.chargeType[index] = value.toString();
                                                  });
                                                  print(models.chargeType);
                                                  print(models.chargeType[index]);
                                                }),
                                          ),
                                        ),
                                        models.lengthDropdown == 1
                                            ? const SizedBox()
                                            : GestureDetector(
                                                onTap: () {
                                                  models.delLength();
                                                  models.chargeType.removeAt(models.lengthDropdown-1);
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
                              models.lengthDropdown == 2 ? SizedBox() : GestureDetector(
                                onTap: () {
                                  models.addLength();
                                  models.addChargeType(itemtype.first);
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
