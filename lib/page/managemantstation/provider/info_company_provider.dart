import 'package:easy_stepper/easy_stepper.dart';

class InfoCompanyProvider extends ChangeNotifier {
  String? _imageUrl;
  String? _imaName;
  String? _namCompany;

  String? get imageUrl => _imageUrl;
  String? get imageName => _imaName;
  String? get namcompany => _namCompany;

  setImageUrl(String? imageUrl) {
    _imageUrl = imageUrl;
    notifyListeners();
  }

  setImageName(String? imageName) {
    _imaName = imageName;
    notifyListeners();
  }

  setNamcompany(String? namcompany) {
    _namCompany = namcompany;
    notifyListeners();
  }

  void clearInfoCompany() {
    _namCompany = null;
    _imageUrl = null;
    _imaName = null;
    notifyListeners();
  }
}
