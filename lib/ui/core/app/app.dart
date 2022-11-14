import 'package:avencia/di.dart';
import 'package:avencia/ui/core/app/auth_state_inherited_widget.dart';
import 'package:avencia/ui/core/app/routing.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
import 'package:helpers/logic/auth/auth_state_bloc.dart';
import 'package:helpers/ui//app/brightness_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BrightnessBuilder(
      getBrightnessStream: uiDeps.getBrightness,
      builder: (context, brightness) => BlocProvider<AuthStateCubit>(
        create: (_) => AuthStateCubit(uiDeps.authFacade),
        child: BlocBuilder<AuthStateCubit, AuthState?>(builder: (context, state) {
          return AuthStateInheritedWidget(
            state: state != null
                ? state.fold(
                    () => AuthenticationState.unauthenticated,
                    (_) => AuthenticationState.authenticated,
                  )
                : AuthenticationState.loading,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              darkTheme: createTheme(Brightness.dark),
              theme: createTheme(Brightness.light),
              themeMode: brightness,
            ),
          );
        }),
      ),
    );
  }
}
