import 'package:avencia/ui/features/new/dashboard/sections/digital_wallets.dart';
import 'package:avencia/ui/features/new/dashboard/sections/overview.dart';
import 'package:avencia/ui/features/new/dashboard/sections/recent_activities.dart';
import 'package:avencia/ui/features/new/simple_screen.dart';
import 'package:flutter/material.dart';

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
