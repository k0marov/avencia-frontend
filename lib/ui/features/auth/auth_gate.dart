import 'package:avencia/logic/features/auth/auth_gate_stream.dart';
import 'package:avencia/ui/core/home_screen.dart';
import 'package:avencia/ui/core/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as fb_ui;

import '../../../di.dart';

class AuthGate extends StatelessWidget {
  final AuthGateStream _authStream;

  AuthGate({Key? key})
      : _authStream = sl<AuthGateStreamFactory>()(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
        stream: _authStream,
        builder: (context, snapshot) => snapshot.data == null
            ? SplashScreen()
            : snapshot.data == AuthState.unauthenticated
                ? const fb_ui.SignInScreen(
                    providerConfigs: [
                      fb_ui.EmailProviderConfiguration(),
                    ],
                  )
                : HomeScreen());
  }
}
