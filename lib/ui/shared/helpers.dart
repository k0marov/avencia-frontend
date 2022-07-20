import 'package:flutter/material.dart';

void pushRoute(BuildContext context, Widget screen) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
