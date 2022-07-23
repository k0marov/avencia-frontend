import 'package:avencia/di.dart';
import 'package:avencia/ui/core/flat_color_button.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as firebase_ui;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return firebase_ui.ProfileScreen(children: [
      FlatColorButton(
        color: Colors.blue,
        text: "Toggle Theme Color",
        onPressed: () => uiDeps.toggleThemeBrightness(),
      )
    ]);
  }
}
