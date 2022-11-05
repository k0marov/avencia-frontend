import 'package:avencia/ui/core/general/helpers.dart';
import 'package:flutter/material.dart';

import '../../features/new/navigation_menu/navigation_menu.dart';
import '../general/themes/theme.dart';
import 'app_bar.dart';

class SimpleScreen extends StatelessWidget {
  final String title;
  final List<Widget> contents;
  const SimpleScreen({
    Key? key,
    required this.title,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Scaffold(
      appBar: createAvenciaAppBar(context),
      drawer: NavigationMenuDrawer(),
      body: Padding(
        padding: ThemeConstants.screenPadding,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title, style: text.headline2),
            ),
            ...contents,
            SizedBox(height: ThemeConstants.sectionSpacing),
          ].withSpaceBetween(height: ThemeConstants.sectionSpacing),
        ),
      ),
    );
  }
}
