import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/errors/state_switch.dart';

import '../../../di.dart';
import 'sections/digital_wallets.dart';
import 'sections/overview.dart';
import 'sections/recent_activities.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return uiDeps.simpleBuilder<UserInfo>(
      load: uiDeps.getUserInfo,
      loadingBuilder: () => SimpleScreen(
        title: "Dashboard",
        contentBuilder: (_) => AspectRatio(aspectRatio: 1, child: loadingWidget),
      ),
      loadedBuilder: (wallets, cubit) => SimpleScreen(
        title: "Dashboard",
        onRefresh: () async => cubit.refresh(),
        contentBuilder: (_) => Column(
          children: [
            OverviewSection(),
            DigitalWalletsSection(),
            RecentActivitiesSection(),
          ],
        ),
      ),
    );
  }
}
