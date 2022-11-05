import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:avencia/ui/core/app/routing.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: createTheme(Brightness.light),
      dark: createTheme(Brightness.dark),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routerFactory(),
        darkTheme: darkTheme,
        theme: theme,
      ),
    );
  }
}
