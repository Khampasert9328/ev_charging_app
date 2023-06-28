import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/page/home/models/getchargebyid_models.dart';
import 'package:ev_charging/page/home/service/getchargebyid_service.dart';

class GetChargeByIdProvider extends ChangeNotifier {
  GetChargeByIdModels? _models;
  GetChargeByIdModels? get models => _models;
  bool _isloading = false;
  bool get isloading => _isloading;

  Future<void> getchargebyid(String id) async {
    _isloading = true;
    _models = await getchargbyid(id);
    if (_models != null) {
      print("models===${_models!.data.name}");
    }
    _isloading = false;
    notifyListeners();
  }
}
