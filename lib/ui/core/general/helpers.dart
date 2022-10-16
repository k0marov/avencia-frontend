import 'package:image_picker/image_picker.dart';

import '../../../logic/core/uploader/simple_file.dart';

Future<SimpleFile?> chooseImage() async {
  final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  return imageFile != null ? SimpleFile(imageFile.path) : null;
}
