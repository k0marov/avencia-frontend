import 'package:avencia/logic/err/errors.dart';
import 'package:flutter/material.dart';

void showExceptionSnackbar(BuildContext context, Exception e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(displayException(e)),
    backgroundColor: Colors.red,
  ));
}
