import 'package:flutter/material.dart';

enum AuthenticationState {
  loading,
  authenticated,
  unauthenticated,
}

class AuthStateInheritedWidget extends InheritedWidget {
  final AuthenticationState state;
  const AuthStateInheritedWidget({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  static AuthStateInheritedWidget of(BuildContext context) {
    final AuthStateInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<AuthStateInheritedWidget>();
    assert(result != null, 'No AuthStateInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AuthStateInheritedWidget old) => old.state != state;
}
