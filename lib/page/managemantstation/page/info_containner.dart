import 'package:dotted_border/dotted_border.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/constant/data.dart';
import 'package:ev_charging/page/managemantstation/page/textformfield/textform.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InfoContainnaer extends StatefulWidget {
  const InfoContainnaer({super.key});

  @override
  State<InfoContainnaer> createState() => _InfoContainnaerState();
}

class _InfoContainnaerState extends State<InfoContainnaer> {
  // List<Map<String, dynamic>> listData = [];
  // final container = EvChargingFormModel();
  // final charge = Constainner();

  List<List<Map<String, dynamic>>> map = [[]];

  List item = [
    "1",
    "2",
    "3",
    "4",
  ];

  // int length = 1;
  int lengthdropdown = 1;


  String? valueitemtype;

  String? valueitem;

  List evModels = [];

  List<Widget> dropdown = [];

  @override
  void initState() {
    context.read<InfoContainerProvider>().getBrandTextCtr();
    context.read<InfoContainerProvider>().getGenTextCtr();
    context.read<InfoContainerProvider>().getModelTextCtr();
    // for(int i = 0; i < context.read<InfoContainerProvider>().count ; i++){
    //   brand?.add(TextEditingController());
    //   generation?.add(TextEditingController());
    //   model?.add(TextEditingController());
    // data.add({
    //   "type_charge" : []
    // });
    // data.add({"type_charge": ListModel(datas: [])});
    super.initState();
  }

  int indexCon = 0;

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
                            Text(models.containersList.length.toString()),
                            Spacer(),
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      models.increment();
                                    },
                                    child: Text("+")),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                    onPressed: () {
                                      if (models.containersList.length > 1) {
                                        models.brand.removeAt(models.containersList.length - 1);
                                        models.model.removeAt(models.containersList.length - 1);
                                        models.generation.removeAt(models.containersList.length - 1);
                                        // data.removeAt(models.count-1);
                                        models.lopTu();
                                      }
                                    },
                                    child: Text("-")),
                              ],
                            )
                          ],
                        )
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
                itemCount: models.containersList.length,
                // itemCount: models.evModel?.length,
                itemBuilder: (context, index1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ຕູ້ທີ ${item[index1]}",
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
                                },
                                text: "ປ້ອນຊື່ຍີ່ຫໍ້",
                                controller: models.brand[index1],
                                onchange: () {
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
                                ontap: (value) {
                                },
                                text: "ປ້ອນຊື່ລຸ້ນ",
                                controller: models.generation[index1],
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
                                },
                                text: "ປ້ອນຊື່ໂມເດລ",
                                controller: models.model[index1],
                                onchange: () {
                                },
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
                              Column(
                                children: List.generate(models.containersList[index1].typeChargingList.length,
                                        (index2) {
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
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.grey[200],
                                              ),
                                              child: DropdownButton(
                                                  isExpanded: true,
                                                  underline: const SizedBox(),
                                                  hint: const Text(
                                                      'ເລືອກປະເພດຫົວສາກ'),
                                                  value: models.containersList[index1].typeChargingList[index2].typeCharging,
                                                  items: AppData.itemtype.map((e) {
                                                    return DropdownMenuItem(
                                                        value: e, child: Text(e));
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    models.dropDown(index1, index2, value.toString());
                                                  }),
                                            ),
                                          ),
                                          models.containersList[index1].typeChargingList.length == 1
                                              ? const SizedBox()
                                              : GestureDetector(
                                            onTap: () {
                                              models.delLength(index1);
                                            },
                                            child: const Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              models.containersList[index1].typeChargingList.length == 2
                                  ? SizedBox()
                                  : GestureDetector(
                                onTap: () {
                                    models.addLength(index1);
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
                              ),
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
