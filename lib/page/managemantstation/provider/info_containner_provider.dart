import 'package:easy_stepper/easy_stepper.dart';

class InfoContainerProvider extends ChangeNotifier {
  int? _count;
  int? get count => _count;

  set number(int? val) {
    _count = val;
    notifyListeners();
  }
}
