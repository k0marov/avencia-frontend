import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:avencia/di.dart';
import 'package:avencia/ui/core/app/splash_screen.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/app/auth_gate.dart';

import '../../features/auth/auth_screen.dart';
import '../../features/new/dashboard/dashboard_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: createTheme(Brightness.light),
      dark: createTheme(Brightness.dark),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        theme: theme,
        home: AuthGate(
          auth: uiDeps.authFacade,
          homeScreen: const DashboardScreen(),
          authScreen: const AuthScreen(),
          splashScreen: const SplashScreen(),
        ),
      ),
    );
  }
}
