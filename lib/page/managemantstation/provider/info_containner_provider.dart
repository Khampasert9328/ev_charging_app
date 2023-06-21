import 'package:easy_stepper/easy_stepper.dart';

class InfoContainerProvider extends ChangeNotifier {
  int _count = 1;
  int get count => _count;

  int _lengthDropdown = 1;
  int get lengthDropdown => _lengthDropdown;
  List<TextEditingController> _brand = [];
  List<TextEditingController> get brand => _brand;


  List<TextEditingController> _generation = [];
  List<TextEditingController> get generation => _generation;

  List<TextEditingController> _model = [];
  List<TextEditingController> get model => _model;

  List<String> _chargeType = [];
  List<String> get chargeType => _chargeType;


  


  void getBrandTextCtr(){
    if(_brand.isEmpty){
        _brand.add(TextEditingController());
    }
  }

  void getGenTextCtr(){
    if(_generation.isEmpty){
        _generation.add(TextEditingController());
    }
  }
  void getModelTextCtr(){
    if(_model.isEmpty){
        _model.add(TextEditingController());
    }
  }

  void addLength(){
    _lengthDropdown++;
    notifyListeners();
  }

  void delLength(){
    _lengthDropdown--;
    notifyListeners();
  }

  void increment() {
    _count++;
    _brand.add(TextEditingController());
    _generation.add(TextEditingController());
    _model.add(TextEditingController());
    notifyListeners();
  }

  void addChargeType(String? val){
    _chargeType.add(val!);
  }

  void lopTu() {
    _count--;
    notifyListeners();
  }
}
