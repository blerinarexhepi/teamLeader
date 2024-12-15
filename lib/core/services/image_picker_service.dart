import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerService = Provider<ImagePickerService>((ref) {
  return ImagePickerService(ref);
});

final imagePicker = Provider((ref) => ImagePicker());

class ImagePickerService {
  const ImagePickerService(this._ref);

  final Ref _ref;

  ImagePicker get _imagePicker => _ref.read(imagePicker);

  Future<XFile?> imgPicker(String option) async {
    final pickedFile = await _imagePicker.pickImage(
      source: option == 'camera' ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      return XFile(pickedFile.path);
    }
    return null;
  }
}
