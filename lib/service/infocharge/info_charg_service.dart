import 'package:ev_charging/constant/domain.dart';
import 'package:ev_charging/page/managemantstation/models/get_info_charg_models.dart';

import 'package:http/http.dart' as http;

Future<GetInfoChargModels?> getinfocharg() async {
  try {
    String url = AppDomain.getinfocharg;
    var response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return getInfoChargModelsFromJson(response.body);
    }
  } catch (e) {
    rethrow;
  }
  return null;
}
