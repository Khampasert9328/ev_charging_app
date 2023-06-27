import 'package:ev_charging/constant/domain.dart';
import 'package:ev_charging/page/home/models/getchargebyid_models.dart';

import 'package:http/http.dart' as http;

Future<GetChargeByIdModels?> getchargbyid(String? id) async {
  try {
    String url = "${AppDomain.getchargebyid}/$id";
    var response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return getChargeByIdModelsFromJson(response.body);
    }
  } catch (e) {
    rethrow;
  }
  return null;
}
