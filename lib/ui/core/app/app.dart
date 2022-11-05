import 'package:avencia/di.dart';
import 'package:avencia/ui/core/app/routing.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui//app/brightness_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BrightnessBuilder(
      getBrightnessStream: uiDeps.getBrightness,
      builder: (context, brightness) => StreamAuthScope(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          darkTheme: createTheme(Brightness.dark),
          theme: createTheme(Brightness.light),
          themeMode: brightness,
        ),
      ),
    );
  }
}
