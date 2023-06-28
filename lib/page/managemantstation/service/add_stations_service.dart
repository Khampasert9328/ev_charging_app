import 'dart:convert';

class AddStationService{
  static Future addStationService(context) async {
    final model = Provider.of<InfoContainerProvider>(context, listen: false);
    final modellocation = Provider.of<InfoLocationProvider>(context, listen: false);
    final modelcompany = Provider.of<InfoCompanyProvider>(context, listen: false);
    String? token = await PreFer().getToken();
    String? province = modellocation.province!.replaceAll("(", "").replaceAll(")", "");
    String? city = modellocation.city!.replaceAll("(", "").replaceAll(")", "");
    String? village = modellocation.village!.replaceAll("(", "").replaceAll(")", "");

    List<Map<String, dynamic>> container = [];

      for (int i = 0; i < model.containersList.length; i++) {
        container.add(
            {
              "count": "ຕູ້ທີ${i + 1}",
              "brand": model.brand[i].text,
              "generation": model.generation[i].text,
              "model": model.model[i].text,
              "type_charge" : [
                for(var j in model.containersList[i].typeChargingList) {
                  "type_charging" : j.index == i ? j.typeCharging : ""
                  }
              ],
            });
      }

      String payload = jsonEncode({
        "name": "Tah test",
        "imagecpn": "https://ad-bucket.sgp1.digitaloceanspaces.com/saveimagecharg/vpk8ae1686974891696.jpg",
        "amount": 3,
        "pictureplace": "https://ad-bucket.sgp1.digitaloceanspaces.com/saveimagecharg/l5qor1686975024299.jpeg",
        "province": "ສະຫວັນນະເຂດ",
        "district": "ໍຊົນບູລີ",
        "village": "ສອງຄອນ",
        "nameplace": "ວິທະຍາໄລສະຫວັນນະເຂດ",
        "lat_location": 17000000,
        "lng_lacation": 1600000000,
        "constainner": container,
        "facilities": [
          {
            "facilitie": "cafe",
            "_id": "64893be4053a02656d9837b0"
          },
          {
            "facilitie": "minibig C",
            "_id": "64893be4053a02656d9837b1"
          },
          {
            "facilitie": "ຮ້ານ ອາຫານຈີນ",
            "_id": "64893be4053a02656d9837b1"
          },
          {
            "facilitie": "ຮ້ານອາຫານກິນດື່ມ",
            "_id": "64893be4053a02656d9837b1"
          },
          {
            "facilitie": "ຮ້ານອາຫານຫວຽດ",
            "_id": "64893be4053a02656d9837b1"
          },
          {
            "facilitie": "ຮ້ານອາຫານຝຣັ່ງ",
            "_id": "64893be4053a02656d9837b1"
          }
        ]
      });

      showDialog(context: context, builder: (_){
        return const LoadingDialog(title: 'ກຳລັງດຳເນີນການ',);
      });

      final res = await http.post(Uri.parse(AppDomain.addStation),
      headers: {
          "accept":"text/plain",
          "Authorization" : "Bearer $token",
          "Content-Type" : "application/json",
        },
        body: payload,
      );
      if(res.statusCode == 201){
        Navigator.pop(context);
        showDialog(context: context, builder: (_){
          return DialogSucces(title: 'ເພີ່ມຂໍ້ມູນສຳເລັດ', onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AllItem()));
            // Navigator.pop(context);
          });
        });
      }else{
        Navigator.pop(context);
        showDialog(context: context, builder: (context){
          return DialogError(title: 'ເກີດຂໍ້ຜິດພາດ', onTap: (){
            Navigator.pop(context);
          });
        });
      }
  }}
