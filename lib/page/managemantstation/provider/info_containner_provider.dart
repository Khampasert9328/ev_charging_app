import 'package:easy_stepper/easy_stepper.dart';
import 'package:ev_charging/constant/data.dart';

class InfoContainerProvider extends ChangeNotifier {

  static int _indexCon = 0;
  static int get indexCon => _indexCon;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  String? _imageName;
  String? get imageName => _imageName;


  final List<TextEditingController> _brand = [];
  List<TextEditingController> get brand => _brand;


  final List<TextEditingController> _generation = [];
  List<TextEditingController> get generation => _generation;

  final List<TextEditingController> _model = [];
  List<TextEditingController> get model => _model;

  final List<String> _chargeType = [];
  List<String> get chargeType => _chargeType;

  final List<TypeCharge> _containersList = [
    TypeCharge(typeChargingList: [TypeCharging(typeCharging: AppData.itemtype.first, index: _indexCon)])
  ];

  List<TypeCharge> get containersList =>  _containersList;


  set setIndex(int val){
    _indexCon = val;
    notifyListeners();
  }

  setImageUrl(String? imageUrl) {
    _imageUrl = imageUrl;
    notifyListeners();
  }

  setImageName(String? imageName) {
    _imageName = imageName;
    notifyListeners();
  }

  void dropDown(int index1, int index2, String value){
    _containersList[index1].typeChargingList[index2].typeCharging = value;
    notifyListeners();
  }

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

  void addLength(int index){
    setIndex = index;
    _containersList[index].typeChargingList.add(
        TypeCharging(typeCharging: AppData.itemtype.first,
            index: _indexCon));
    notifyListeners();
  }

  void delLength(int index){
    _containersList[index].typeChargingList.removeLast();
    notifyListeners();
  }

  void increment() {
   if(_containersList.length < 4){
     setIndex = containersList.length;
     _containersList.add(TypeCharge(typeChargingList: [TypeCharging(typeCharging: AppData.itemtype.first, index: _indexCon)]));
     _brand.add(TextEditingController());
     _generation.add(TextEditingController());
     _model.add(TextEditingController());
   }
    notifyListeners();
  }

  void addChargeType(String? val){
    _chargeType.add(val!);
  }

  void lopTu() {
    _containersList.removeLast();
    notifyListeners();
  }
}

class TypeCharging{
  int index;
  String typeCharging;
  TypeCharging({required this.typeCharging, required this.index});
}

class TypeCharge{
  List<TypeCharging> typeChargingList;

  TypeCharge({required this.typeChargingList});
}
