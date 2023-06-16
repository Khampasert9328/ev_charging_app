import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/page/managemantstation/models/get_info_charg_models.dart';
import 'package:ev_charging/service/infocharge/info_charg_service.dart';

class InfoChargProvider extends ChangeNotifier {
  bool _isload = false;
  GetInfoChargModels? _chargModels;
  GetInfoChargModels? get getchargmodels => _chargModels;
  bool get isload => _isload;
  Future<void> getchargprovider() async {
    _isload = true;
    _chargModels = await getinfocharg();
    _isload = false;
    notifyListeners();
  }
}
