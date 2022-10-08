import 'package:avencia/logic/core/general.dart';
import 'package:avencia/logic/err/errors.dart';
import 'package:flutter/material.dart';

void showExceptionSnackbar(BuildContext context, Exception e) {
  printDebug("showing a snackbar");
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Text(displayException(e), style: TextStyle(color: Colors.white)),
        Spacer(),
        TextButton(
          child: Text("Dismiss"),
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ],
    ),
    backgroundColor: Colors.red,
  ));
}
