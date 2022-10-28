import 'package:helpers/logic/uploader/simple_file.dart';
import 'package:image_picker/image_picker.dart';

Future<SimpleFile?> chooseImage() async {
  final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  return imageFile != null ? SimpleFile(imageFile.path) : null;
}
