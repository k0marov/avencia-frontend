import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:flutter/material.dart';

import 'sections/digital_wallets.dart';
import 'sections/overview.dart';
import 'sections/recent_activities.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleScreen(
      title: "Dashboard",
      contents: [
        OverviewSection(),
        DigitalWalletsSection(),
        RecentActivitiesSection(),
      ],
    );
  }
}
