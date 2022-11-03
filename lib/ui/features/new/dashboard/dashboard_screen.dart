import 'package:avencia/ui/features/new/dashboard/sections/digital_wallets.dart';
import 'package:avencia/ui/features/new/dashboard/sections/overview.dart';
import 'package:avencia/ui/features/new/dashboard/sections/recent_activities.dart';
import 'package:flutter/material.dart';

import '../app_bar.dart';
import '../navigation_menu/navigation_menu.dart';

const screenPadding = EdgeInsets.symmetric(vertical: 5, horizontal: 12);
const sectionSpacing = 15.0;
const cardSpacing = 12.0;
const buttonSize = 40.0;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Scaffold(
      drawer: NavigationMenuDrawer(),
      appBar: createAvenciaAppBar(context),
      body: Padding(
        padding: screenPadding,
        child: ListView(children: [
          Text("Dashboard", style: text.headline1),
          const SizedBox(height: sectionSpacing),
          OverviewSection(),
          const SizedBox(height: sectionSpacing),
          DigitalWalletsSection(),
          const SizedBox(height: sectionSpacing),
          RecentAcitvitiesSection(),
          const SizedBox(height: sectionSpacing),
        ]),
      ),
    );
  }
}
