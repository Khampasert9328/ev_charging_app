import 'package:ev_charging/constant/color.dart';
import 'package:ev_charging/page/managemantstation/provider/info_containner_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InfoContainerProvider>(builder: (ctn, model, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
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
          padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "images/image1.png",
                    height: 160.h,
                    width: 157.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "ຈຳນວນຕູ້ສາກ: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(model.count.toString()),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("ຕູ້"),
                        ],
                      ),
                      const Text(
                        "ປະເພດຫົວສາກ: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset("images/EV Charger-02.svg"),
                              Text("GB/T DC"),
                              Text("120KW/T DC"),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset("images/EV Charger-03.svg"),
                              Text("CSS 2"),
                              Text("120KW/T DC"),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    "images/loca.png",
                    height: 50.h,
                    width: 50.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ສູນການຄ້າ ພາກຊັນ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text("ເຈົ້າຂອງ:"),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Text(
                            "ບໍລິສັດ ໂລກ້າ ຈຳກັດ",
                            style: TextStyle(
                              color: EV_Colors.yellowbtncolor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("ສະຖານທີ່:"),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Text(
                            "ນະຄອນຫລວງວຽງຈັນ ເມືອງ ຈັນທະບູລີ ບ້ານ ໝອງຈັນ",
                            style: TextStyle(
                              color: EV_Colors.yellowbtncolor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Divider(),

              Text("ຂໍ້ມູນຕູ້ສາກ", style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),),
             SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: model.count,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                           // "",
                          model.brand[index].text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }),
              const Text(
                "ສິ່ງອຳນວຍຄວາມສະດວກ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "ຮ້ານ ກາເຟ",
              ),
              const Text(
                "ຮ້ານ ປິ້ງເປັດ",
              ),
              const Text(
                "ມິນິບິກຊີ",
              ),
            ],
          ),
        ),
      )
        ],
      );
    });
  }
}
