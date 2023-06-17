import 'package:easy_stepper/easy_stepper.dart';

class InfoContainerProvider extends ChangeNotifier {
  int? _count;
  int? get count => _count;


  List<String> _listItem = [];
  List<String> get listItem => _listItem;

  set number(int? val) {
    _count = val;
    notifyListeners();
  }
  set listContainner(List<String> val) {
    _listItem = val;
    notifyListeners();
  }
}
