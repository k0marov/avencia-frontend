import 'package:avencia/ui/features/new/dashboard/dashboard_screen.dart';
import 'package:avencia/ui/features/new/orders/orders_screen.dart';
import 'package:avencia/ui/features/new/profile/profile_screen.dart';
import 'package:avencia/ui/features/new/wallets/wallets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: refactor the navigation using go_route

class RouteButtons extends StatelessWidget {
  const RouteButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _RouteButton(
        isSelected: true,
        icon: Icons.space_dashboard_outlined,
        text: "Dashboard",
        screen: DashboardScreen(),
      ),
      _RouteButton(
        icon: Icons.person_outline,
        text: "My Account",
        screen: NewProfileScreen(),
      ),
      _RouteButton(
        icon: Icons.wallet_outlined,
        text: "Wallets",
        screen: WalletsScreen(),
      ),
      _RouteButton(
        icon: Icons.list,
        text: "Orders",
        screen: OrdersScreen(),
      ),
      _RouteButton(
        icon: Icons.settings_outlined,
        text: "Settings",
        screen: Container(),
      ),
    ]);
  }
}

class _RouteButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String text;
  final Widget screen;
  const _RouteButton({
    Key? key,
    this.isSelected = false,
    required this.icon,
    required this.text,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: isSelected ? theme.colorScheme.primary.withAlpha(10) : Colors.transparent,
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => screen)),
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
