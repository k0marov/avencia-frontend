import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:avencia/di.dart';
import 'package:avencia/ui/core/app/splash_screen.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/features/new/orders/orders_screen.dart';
import 'package:avencia/ui/features/new/wallets/wallets.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/app/auth_gate.dart';
import 'package:helpers/ui/app/home_screen.dart';

import '../../features/auth/auth_screen.dart';
import '../../features/new/dashboard/dashboard_screen.dart';
import '../../features/new/profile/profile_screen.dart';

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
                WalletsScreen(),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notes),
                  label: 'Funds',
                ),
              ),
              Tuple2(
                OrdersScreen(),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Orders',
                ),
              ),
              Tuple2(
                NewProfileScreen(),
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
