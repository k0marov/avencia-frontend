import 'package:avencia/di.dart';
import 'package:avencia/ui/core/app/splash_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/app/auth_gate.dart';
import 'package:helpers/ui/app/brightness_builder.dart';
import 'package:helpers/ui/app/home_screen.dart';

import '../../features/auth/auth_screen.dart';
import '../../features/funds/funds_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/transactions/transaction_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BrightnessBuilder(
      getBrightnessStream: uiDeps.getThemeBrightnessStream,
      builder: (context, brightness) => MaterialApp(
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        themeMode: brightness,
        home: AuthGate(
          auth: uiDeps.authFacade,
          homeScreen: const HomeScreen(
            screens: [
              Tuple2(
                TransactionScreen(),
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
