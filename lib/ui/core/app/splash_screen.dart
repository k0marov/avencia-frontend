import 'package:avencia/ui/core/app/logo_widget.dart';
import 'package:flutter/material.dart';

// TODO: handle the No Internet Connection case

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LogoWidget()),
    );
  }
}
