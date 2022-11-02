import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const LogoWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: width,
      height: height,
      Theme.of(context).brightness == Brightness.light
          ? "assets/logo_with_dark_title.png"
          : "assets/logo_with_light_title.png",
    );
  }
}
