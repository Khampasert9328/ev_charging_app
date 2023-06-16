import 'package:easy_stepper/easy_stepper.dart';

class InfoCompanyProvider extends ChangeNotifier {
  String? _imageUrl;
  String? _imaName;

  String? get imageUrl => _imageUrl;
  String? get imageName => _imaName;

  setImageUrl(String? imageUrl) {
    _imageUrl = imageUrl;
    notifyListeners();
  }
  setImageName(String? imageName) {
    _imaName = imageName;
    notifyListeners();
  }
}
