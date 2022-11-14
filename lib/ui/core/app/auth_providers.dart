import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
import 'package:helpers/logic/auth/auth_state_bloc.dart';

import '../../../di.dart';
import 'auth_state_inherited_widget.dart';

class AuthProviders extends StatelessWidget {
  final Widget child;
  const AuthProviders({Key? key, required this.child}) : super(key: key);

  AuthenticationState _convertState(AuthState? state) => state != null
      ? state.fold(
          () => AuthenticationState.unauthenticated,
          (_) => AuthenticationState.authenticated,
        )
      : AuthenticationState.loading;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthStateCubit>(
      create: (_) => AuthStateCubit(uiDeps.authFacade),
      child: BlocBuilder<AuthStateCubit, AuthState?>(
        buildWhen: (prev, curr) => _convertState(prev) != _convertState(curr),
        builder: (context, state) => AuthStateInheritedWidget(
          state: _convertState(state),
          child: child,
        ),
      ),
    );
  }
}
