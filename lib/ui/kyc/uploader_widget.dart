import 'package:avencia/logic/kyc/presentation/passport_cubit.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/errors/state_switch.dart';

import '../../logic/core/uploader/simple_file.dart';

class UploaderWidget extends StatelessWidget {
  final FileUploadState state;
  final Function(SimpleFile) onFileChosen;
  const UploaderWidget({
    Key? key,
    required this.state,
    required this.onFileChosen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      state.fold(
        () => Text("Uploading..."),
        (some) => some.fold(
          (e) => ExceptionWidget(exception: e),
          (uploaded) => Text(
            uploaded ? "File was successfully uploaded." : "Please upload an image",
          ),
        ),
      ),
      Spacer(),
      ElevatedButton(
        onPressed: () => chooseImage().then((image) => image != null ? onFileChosen(image) : null),
        child: Text("Upload"),
      ),
    ]);
  }
}
