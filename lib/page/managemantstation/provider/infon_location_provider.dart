import 'package:flutter/material.dart';

class InfoLocationProvider extends ChangeNotifier {
  String? _longtitude, _latitude;
  String? _province, _city, _village;
  String? _nameplace;
  String? get province => _province;
  String? get city => _city;
  String? get village => _village;
  String? get nameplace => _nameplace;
  int _lengthplace = 1;
  int get lengthplace => _lengthplace;
  List<String> _listplace = [];
  List<String> get listplace => _listplace;

  final List<TextEditingController> _facilities = [TextEditingController()];
  List<TextEditingController> get facilities  => _facilities;

  String? get latitude => _latitude;
  String? get longtitude => _longtitude;

  void addFacilities(){
    _facilities.add(TextEditingController());
    notifyListeners();
  }

  void delFacilities(int index){
    _facilities.removeAt(index);
    notifyListeners();
  }

  void addlengthplace() {
    _lengthplace++;
    notifyListeners();
  }

  void deletelengthplace() {
    _lengthplace--;
    notifyListeners();
  }

  void addlistplace(String val) {
    _listplace.add(val);
    notifyListeners();
  }

  set proName(String? val) {
    _province = val;
    notifyListeners();
  }

  set disName(String? val) {
    _city = val;
    notifyListeners();
  }

  set villName(String? val) {
    _village = val;
    notifyListeners();
  }

  /// Province that user live in
  setProvince(String? province) {
    _province = province;
    notifyListeners();
  }

  /// District that user live in
  setCity(String? city) {
    _city = city;
    notifyListeners();
  }

  /// Village that user live in
  setVillage(String? village) {
    _village = village;
    notifyListeners();
  }

  //nameplace
  setNamPlace(String? nameplace) {
    _nameplace = nameplace;
    notifyListeners();
  }

   setLatitude(String? val) {
    _latitude = val;
    notifyListeners();
  }

  setLongitude(String? val){
    _longtitude = val;
    notifyListeners();
  }

  void clearInfolocation() {
    _province = null;
    _city = null;
    _village = null;
    _nameplace = null;
    _lengthplace = 1;
    _listplace = [];
    notifyListeners();
  }
}
