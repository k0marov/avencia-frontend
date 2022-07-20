import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as fb_ui;

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fb_ui.SignInScreen(
      providerConfigs: [
        fb_ui.EmailProviderConfiguration(),
      ],
    );
  }
}
