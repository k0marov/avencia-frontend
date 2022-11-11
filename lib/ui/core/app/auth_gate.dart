import 'package:avencia/di.dart';
import 'package:avencia/ui/core/app/routing.dart';
import 'package:avencia/ui/core/app/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:helpers/logic/auth/auth_state_bloc.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthStateCubit(uiDeps.authFacade),
      child: BlocListener<AuthStateCubit, AuthState>(
        listener: (context, state) {
          print(state);
          switch (state) {
            case AuthState.loading:
              return;
            case AuthState.authenticated:
              return context.go(Routes.dashboard.fullPath);
            case AuthState.unauthenticated:
              return context.go(Routes.login.fullPath);
          }
        },
        child: SplashScreen(),
      ),
    );
  }
}
