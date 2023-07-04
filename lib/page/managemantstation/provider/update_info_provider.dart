import 'package:easy_stepper/easy_stepper.dart';

import '../../../constant/data.dart';




class UpdateInfoProvider extends ChangeNotifier{
  static int _indexCon = 0;
  static int get indexCon => _indexCon;

  final List<TextEditingController> _brand = [];
  List<TextEditingController> get brand => _brand;

  final List<TextEditingController> _gen = [];
  List<TextEditingController> get gen => _gen;

  final List<TextEditingController> _model = [];
  List<TextEditingController> get model => _model;

  final List<TextEditingController> _facilities = [];
  List<TextEditingController> get facilities => _facilities;

  final List<UpdateTypeCharge> _containersList = [
    // UpdateTypeCharge(typeChargingList: [UpdateTypeCharging(typeCharging: AppData.typeChargeItem.first, index: _indexCon)])
  ];

  List<UpdateTypeCharge> get containersList => _containersList;

  String? _imageStation;
  String? get imageStation => _imageStation;

  String? _imageCpn;
  String? get imageCpn => _imageCpn;

  final TextEditingController _namePlace = TextEditingController();
  TextEditingController get namePlace => _namePlace;

  final TextEditingController _nameCpn = TextEditingController();
  TextEditingController get nameCpn => _nameCpn;


  void dropDown(int index1, int index2, String value) {
    _containersList[index1].typeChargingList[index2].typeCharging = value;
    notifyListeners();
  }

  void addValue(int index, int index2) {
    setIndex = index;
    _containersList[index].typeChargingList.add(UpdateTypeCharging(typeCharging: AppData.typeChargeItem.first, index: index2));

    notifyListeners();
  }

  // set containerList(List<TypeCharge> val){
  //
  // }

  set setIndex(int val) {
    _indexCon = val;
    notifyListeners();
  }

  void getBrandTextCtr() {
      _brand.add(TextEditingController());
  }

  void getModelTextCtr() {
      _model.add(TextEditingController());
  }
  void getGenTextCtr() {
      _gen.add(TextEditingController());
  }

  void addLength(int index) {
    setIndex = index;
    // _containersList[index].typeCharge.add(AppData.typeChargeItem.first);
    _containersList[index].typeChargingList.add(UpdateTypeCharging(typeCharging: AppData.typeChargeItem.first, index: _indexCon));
    notifyListeners();
  }

  void delLength(int index) {
    _containersList[index].typeChargingList.removeLast();
    // _containersList[index].typeCharge.removeLast();
    notifyListeners();
  }

  /// pherm tu
  void addEvCharger() {
    // if (_containersList.length < 4) {
      setIndex = _containersList.length;
      _containersList.add(UpdateTypeCharge(typeChargingList: [UpdateTypeCharging(typeCharging: AppData.typeChargeItem.first, index: _indexCon)]));
      _brand.add(TextEditingController());
      _gen.add(TextEditingController());
      _model.add(TextEditingController());
    // }
    notifyListeners();
  }

  void initEvCharger() {
      _brand.add(TextEditingController());
      _gen.add(TextEditingController());
      _model.add(TextEditingController());
      notifyListeners();
  }


  /// lop tu
  void delEvCharger() {
    _containersList.removeLast();
    _brand.removeLast();
    _gen.removeLast();
    _model.removeLast();
    notifyListeners();
  }

  void addFacilities(){
    _facilities.add(TextEditingController());
    notifyListeners();
  }

  void delFacilities(int index){
    _facilities.removeAt(index);
    notifyListeners();
  }

  void setImageStation(String? val){
    _imageStation = val;
    notifyListeners();
  }

  void setImageCpn(String? val){
    _imageCpn = val;
    notifyListeners();
  }

  void clearForm() {
    _imageStation = null;
    _imageCpn = null;
    _containersList.clear();
    _brand.clear();
    _gen.clear();
    _model.clear();
    _facilities.clear();
    _indexCon = 0;
    notifyListeners();
  }
}

class UpdateTypeCharging {
  int index;
  String typeCharging;
  UpdateTypeCharging({required this.typeCharging, required this.index});
}

class UpdateTypeCharge {
  List<UpdateTypeCharging> typeChargingList;

  UpdateTypeCharge({required this.typeChargingList});
}