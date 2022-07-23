import 'package:avencia/di.dart';
import 'package:avencia/logic/theme_brightness/theme_brightness.dart';
import 'package:avencia/ui/auth/auth_gate.dart';
import 'package:flutter/material.dart';

import 'auth/auth_gate.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeBrightness>(
        stream: uiDeps.getThemeBrightnessStream(),
        builder: (context, snapshot) {
          final brightness = snapshot.data ?? ThemeBrightness.light;
          late final ThemeMode theme;
          switch (brightness) {
            case ThemeBrightness.dark:
              theme = ThemeMode.dark;
              break;
            case ThemeBrightness.light:
              theme = ThemeMode.light;
              break;
          }
          return MaterialApp(
            title: 'Avencia',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: theme,
            home: AuthGate(),
          );
        });
  }
}
