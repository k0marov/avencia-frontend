import 'package:avencia/logic/auth/auth_facade.dart';
import 'package:avencia/ui/core/splash_screen.dart';
import 'package:avencia/ui/transactions/home_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../di.dart';
import 'auth_screen.dart';

class AuthGate extends StatelessWidget {
  final Stream<Option<AuthToken>> _authStream;

  AuthGate({Key? key})
      : _authStream = uiDeps.authFacade.getTokenStream(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Option<AuthToken>>(
      stream: _authStream,
      builder: (context, snapshot) => snapshot.hasData
          ? snapshot.data!.fold(
              () => AuthScreen(),
              (_) => HomeScreen(),
            )
          : SplashScreen(),
    );
  }
}
