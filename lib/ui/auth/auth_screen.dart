import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as fb_ui;

import '../core/logo_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fb_ui.SignInScreen(
      headerMaxExtent: 250,
      headerBuilder: (context, constraints, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: LogoWidget(),
          ),
        );
      },
      providerConfigs: [
        fb_ui.EmailProviderConfiguration(),
      ],
    );
  }
}