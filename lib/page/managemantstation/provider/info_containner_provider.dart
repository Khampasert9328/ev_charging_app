import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/page/managemantstation/models/get_info_charg_models.dart';

class InfoContainerProvider extends ChangeNotifier {
  int? _count;
  int? get count => _count;
  List<GetInfoChargModels>? _models = [];
  List<GetInfoChargModels>? get models => _models;

  List<String> _listItem = [];
  List<String> get listItem => _listItem;

  set number(int? val) {
    _count = val;
    notifyListeners();
  }

  void setInfoCharg(Constainner charg) {
   List<GetInfoChargModels> datainfo = _models!.where((element) => element.data.first.id == charg.id).toList();
    if (datainfo.isEmpty) {
      // datainfo.add(GetInfoChargModel(data: charg));
    } else {
      for (var i in _models!) {
        i.data.first.id == charg.id;
        i.data.first.constainner.first.brand = charg.brand;
        i.data.first.constainner.first.generation = charg.generation;
        i.data.first.constainner.first.model = charg.model;
      }
    }
    notifyListeners();
  }
}
