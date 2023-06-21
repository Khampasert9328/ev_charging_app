import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/page/form_owner_company.dart';
import 'package:ev_charging/page/managemantstation/page/info_containner.dart';
import 'package:ev_charging/page/managemantstation/page/info_location_station.dart';
import 'package:ev_charging/page/managemantstation/page/summary.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:ev_charging/page/managemantstation/service/add_stations_service.dart';
import 'package:ev_charging/widget/dialog/loading.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BodyAddStation extends StatefulWidget {
  const BodyAddStation({super.key});

  @override
  State<BodyAddStation> createState() => _BodyAddStationState();
}

class _BodyAddStationState extends State<BodyAddStation> {
  int activeStep = 0;
  final _key = GlobalKey<FormState>();

  TextEditingController namecompany = TextEditingController();
  String selectedImagePath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: activeStep == 0
          ? GestureDetector(
              onTap: () async {
                if (_key.currentState!.validate()) {
                  setState(() {
                    activeStep = 1;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                alignment: Alignment.center,
                height: 46.h,
                width: double.infinity,
                decoration: BoxDecoration(color: EV_Colors.yellowbtncolor, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "ຕໍ່ໄປ",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: EV_Colors.whitecolor,
                  ),
                ),
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        if (activeStep > 0) {
                          activeStep--;
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                      alignment: Alignment.center,
                      height: 46.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "ກັບຄືນ",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: EV_Colors.whitecolor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                        // print(context.read<InfoContainerProvider>().evModel);

                      setState(() {
                        if (activeStep < 3) {
                          activeStep++;
                        }
                        });
                    },
                    child: activeStep >= 3
                        ? GestureDetector(
                            onTap: () {
                              AddStationService.addStationService(context);
                              // EVDialog().showDialogSuccess(context, "ແຈ້ງເຕືອນ", "ບັນທຶກຂໍ້ມູນສຳເລັດແລ້ວ", () {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                              alignment: Alignment.center,
                              height: 46.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: EV_Colors.yellowbtncolor, borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "ເພີ່ມ",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: EV_Colors.whitecolor,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                            alignment: Alignment.center,
                            height: 46.h,
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: EV_Colors.yellowbtncolor, borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "ຕໍ່ໄປ",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: EV_Colors.whitecolor,
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100.h,
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
                child: EasyStepper(
                  unreachedLineColor: Colors.grey[200],
                  finishedLineColor: EV_Colors.yellowbtncolor,
                  finishedStepTextColor: EV_Colors.yellowbtncolor,
                  finishedStepBorderColor: EV_Colors.yellowbtncolor,
                  finishedStepIconColor: EV_Colors.yellowbtncolor,
                  activeStepTextColor: EV_Colors.yellowbtncolor,
                  //activeStepIconColor: EV_Colors.yellowbtncolor,
                  activeStepBorderColor: EV_Colors.yellowbtncolor,
                  activeStep: activeStep,
                  lineLength: 30.w,
                  lineThickness: 3,
                  lineSpace: 4,
                  lineType: LineType.normal,
                  defaultLineColor: EV_Colors.yellowbtncolor,
                  defaultStepBorderType: BorderType.dotted,
                  borderThickness: 10,
                  internalPadding: 15,
                  loadingAnimation: 'images/loading_circle.json',
                  showLoadingAnimation: true,
                  steps: const [
                    EasyStep(
                      icon: Icon(CupertinoIcons.person_alt_circle_fill),
                      title: 'ຂໍ້ມູນເຈົ້າຂອງ',
                    ),
                    EasyStep(
                      icon: Icon(CupertinoIcons.lock_circle),
                      title: 'ຂໍ້ມູນຕູ້ສາກ',
                    ),
                    EasyStep(
                      icon: Icon(CupertinoIcons.location_solid),
                      title: 'ຂໍ້ມູນທີ່ຕັ້ງ',
                    ),
                    EasyStep(
                      icon: Icon(CupertinoIcons.doc_chart_fill),
                      title: 'ສະຫຼຸບ',
                    ),
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Form(
                key: _key,
                child: body(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    switch (activeStep) {
      case 0:
        return OwnerCompany(
          namecompany: namecompany,
        );

      case 1:
        return const InfoContainnaer();

      case 2:
        return const InfoLocationStation();

      case 3:
        return const Summary();
    }
    return const SizedBox();
  }
}
