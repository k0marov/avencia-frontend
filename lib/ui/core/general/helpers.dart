import 'package:flutter/material.dart';
import 'package:helpers/logic/uploader/simple_file.dart';
import 'package:image_picker/image_picker.dart';

Future<SimpleFile?> chooseImage() async {
  final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  return imageFile != null ? SimpleFile(imageFile.path) : null;
}

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];
}
