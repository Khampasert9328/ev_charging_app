
import 'package:ev_charging/page/managemantstation/models/get_info_charg_models.dart';
import 'package:ev_charging/service/infocharge/info_charg_service.dart';
import 'package:flutter/material.dart';

class InfoChargProvider extends ChangeNotifier {
  bool _isload = false;
  GetInfoChargModels? _chargModels;
  GetInfoChargModels? get getchargmodels => _chargModels;
  bool get isload => _isload;

  Future<void> getchargprovider() async {
    _isload = true;
    _chargModels = await getinfocharg();
    if (_chargModels != null) {
      print(_chargModels!.data.first.latLocation);
      print(_chargModels!.data.first.lngLacation);
    }
    _isload = false;
    notifyListeners();
  }
}
