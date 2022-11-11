import 'package:flutter/material.dart';

import '../../features/navigation_menu/navigation_menu.dart';
import '../general/themes/theme.dart';
import 'app_bar.dart';

class SimpleScreen extends StatelessWidget {
  final String title;
  final Widget Function(BuildContext) contentBuilder;
  final Future<void> Function()? onRefresh;
  const SimpleScreen({
    Key? key,
    required this.title,
    this.onRefresh,
    required this.contentBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    final mainContent = ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(title, style: text.headline2),
        ),
        SizedBox(height: ThemeConstants.sectionSpacing),
        contentBuilder(context),
        SizedBox(height: ThemeConstants.sectionSpacing),
      ],
    );
    print("rebuild");
    return Scaffold(
      appBar: createAvenciaAppBar(context),
      drawer: NavigationMenuDrawer(),
      body: Padding(
        padding: ThemeConstants.screenPadding,
        child: onRefresh != null
            ? RefreshIndicator(onRefresh: onRefresh!, child: mainContent)
            : mainContent,
      ),
    );
  }
}
