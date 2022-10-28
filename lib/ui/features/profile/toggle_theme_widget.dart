import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ToggleThemeWidget extends StatelessWidget {
  const ToggleThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: AdaptiveTheme.of(context).toggleThemeMode,
      child: Text("Toggle Theme Color"),
    );
  }
}
