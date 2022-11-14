import 'dart:async';

import 'package:avencia/ui/core/app/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const navigationDelay = Duration(milliseconds: 100);

class RouteButtons extends StatelessWidget {
  const RouteButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _RouteButton(
        icon: Icons.space_dashboard_outlined,
        text: "Dashboard",
        route: Routes.dashboard,
      ),
      _RouteButton(
        icon: Icons.person_outline,
        text: "My Account",
        route: Routes.account,
      ),
      _RouteButton(
        icon: Icons.wallet_outlined,
        text: "Wallets",
        route: Routes.wallets,
      ),
      _RouteButton(
        icon: Icons.currency_exchange,
        text: "Transfers",
        route: Routes.transfer,
      ),
      _RouteButton(
        icon: Icons.list,
        text: "Orders",
        route: Routes.orders,
      ),
      _RouteButton(
        icon: Icons.settings_outlined,
        text: "Settings",
        route: Routes.settings,
      ),
    ]);
  }
}

class _RouteButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Routes route;
  const _RouteButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).location;
    final isSelected = currentRoute == route.fullPath;
    final theme = Theme.of(context);
    return Container(
      color: isSelected ? theme.colorScheme.primary.withAlpha(10) : Colors.transparent,
      child: InkWell(
        onTap: () async {
          await Future.delayed(navigationDelay);
          Scaffold.of(context).closeDrawer();
          context.go(route.fullPath);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            SizedBox(width: 10),
            Icon(
              icon,
              size: 30,
              color: isSelected ? theme.colorScheme.primary : theme.iconTheme.color,
            ),
            SizedBox(width: 20),
            Text(text, style: theme.textTheme.headline3),
          ]),
        ),
      ),
    );
  }
}
