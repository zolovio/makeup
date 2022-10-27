import 'dart:io';

import 'package:flutter/services.dart';
import 'package:images_picker/images_picker.dart';

class ImagePickerDep {
  late List<File> file = [];

  ///  pick image from gallery
  Future<List<File>> pickImageFromGallery({bool isLoggerImage = false}) async {
    return await _imagesPicker(isLoggerImage: isLoggerImage);
  }

  ///  pick image from camera
  Future<List<File>> pickImageFromCamera({bool isLoggerImage = false}) async {
    return await _imagesPickFromCamera(isLoggerImage: isLoggerImage);
  }

  ///  pick multiple image
  Future<List<File>> pickMultipleImage({bool isLoggerImage = false}) async {
    return await _imagesPicker(count: 5, isLoggerImage: isLoggerImage);
  }

  /// private function
  Future<List<File>> _imagesPicker({int count = 1, isLoggerImage}) async {
    file.clear();
    try {
      List<Media>? pickedFileList = await ImagesPicker.pick(
        count: count,
        pickType: PickType.image,
        language: Language.System,
        maxTime: 30,
        quality: 0.5,
        maxSize: 50,
        cropOpt: isLoggerImage
            ? null
            : CropOption(
                aspectRatio: CropAspectRatio.custom,
              ),
      );
      if (pickedFileList != null) {
        pickedFileList.forEach((image) {
          file.add(File(image.path));
        });
      }
    } on PlatformException catch (e) {}
    return file;
  }

  Future<List<File>> _imagesPickFromCamera(
      {required bool isLoggerImage}) async {
    file.clear();
    try {
      List<Media>? pickedFileList = await ImagesPicker.openCamera(
        pickType: PickType.image,
        language: Language.System,
        maxTime: 30,
        maxSize: 50,
        quality: 0.5,
        cropOpt: isLoggerImage
            ? null
            : CropOption(
                aspectRatio: CropAspectRatio.custom,
              ),
      );
      if (pickedFileList != null) {
        pickedFileList.forEach((image) {
          file.add(File(image.path));
        });
      }
    } on PlatformException catch (e) {}
    return file;
  }
}
