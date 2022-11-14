import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/simple_cubit.dart';
import 'package:helpers/ui/errors/state_switch.dart';

import '../../../di.dart';
import 'sections/digital_wallets.dart';
import 'sections/overview.dart';
import 'sections/recent_activities.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return uiDeps.simpleBuilder<FullUserInfo>(
      load: uiDeps.getUserInfo,
      loadingBuilder: () => SimpleScreen(
        title: "Dashboard",
        contentBuilder: (_) => AspectRatio(aspectRatio: 1, child: loadingWidget),
      ),
      loadedBuilder: (context, wallets) => SimpleScreen(
        title: "Dashboard",
        onRefresh: () async => context.read<SimpleCubit<FullUserInfo>>().refresh(),
        contentBuilder: (_) => Column(
          children: [
            OverviewSection(),
            DigitalWalletsSection(),
            RecentActivitiesSection(),
          ].withSpaceBetween(height: ThemeConstants.sectionSpacing),
        ),
      ),
    );
  }
}
