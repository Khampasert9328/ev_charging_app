import 'dart:io';

import 'package:ev_charging/page/managemantstation/models/image_models.dart';
import 'package:ev_charging/page/managemantstation/service/add_image.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future<UploadimageModels?> onOpenFile(ImageSource source, context) async {
    final image = await ImagePicker().pickImage(source: source, imageQuality: 10);
    UploadimageModels? urlimage;
    if (image != null) {
      File file = File(image.path);
      urlimage = await AddImage.addimage(file, context);
      return urlimage;
    }
    return null;
  }
}
