import 'package:avencia/di.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:avencia/ui/features/new/dashboard/section_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/simple_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleScreen(
      title: "Settings",
      contents: [
        _AppearanceSection(),
      ],
    );
  }
}

class _AppearanceSection extends StatelessWidget {
  const _AppearanceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    final themeName = theme.brightness == Brightness.light ? "Light" : "Dark";
    return SectionWidget(
      title: Text("Appearance"),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Text("Theme", style: text.headline2),
          Spacer(),
          SizedBox(
            width: 200,
            child: SimpleButton(
              onPressed: uiDeps.toggleBrightness,
              contents: Text(themeName),
            ),
          ),
        ]),
      ),
    );
  }
}
