import 'package:avencia/ui/features/new/dashboard/sections/digital_wallets.dart';
import 'package:avencia/ui/features/new/dashboard/sections/overview.dart';
import 'package:avencia/ui/features/new/dashboard/sections/recent_activities.dart';
import 'package:avencia/ui/features/new/simple_screen.dart';
import 'package:flutter/material.dart';

const screenPadding = EdgeInsets.symmetric(vertical: 5, horizontal: 12);
const sectionSpacing = 15.0;
const cardSpacing = 12.0;
const buttonSize = 40.0;

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
