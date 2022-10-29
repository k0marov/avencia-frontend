import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:avencia/di.dart';
import 'package:avencia/ui/core/app/splash_screen.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/features/dashboard/dashboard_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/app/auth_gate.dart';
import 'package:helpers/ui/app/home_screen.dart';

import '../../features/auth/auth_screen.dart';
import '../../features/funds/funds_screen.dart';
import '../../features/profile/profile_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: createLightTheme(),
      dark: createLightTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        theme: theme,
        home: AuthGate(
          auth: uiDeps.authFacade,
          homeScreen: const HomeScreen(
            screens: [
              Tuple2(
                DashboardScreen(),
                BottomNavigationBarItem(
                  icon: Icon(Icons.request_quote),
                  label: 'Transactions',
                ),
              ),
              Tuple2(
                FundsScreen(),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notes),
                  label: 'Funds',
                ),
              ),
              Tuple2(
                ProfileScreen(),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              )
            ],
          ),
          authScreen: const AuthScreen(),
          splashScreen: const SplashScreen(),
        ),
      ),
    );
  }
}
