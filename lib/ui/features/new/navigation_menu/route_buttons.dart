import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteButtons extends StatelessWidget {
  const RouteButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _RouteButton(
        isSelected: true,
        icon: Icons.space_dashboard_outlined,
        text: "Dashboard",
      ),
      _RouteButton(
        icon: Icons.person_outline,
        text: "My Account",
      ),
      _RouteButton(
        icon: Icons.wallet_outlined,
        text: "Wallets",
      ),
      _RouteButton(
        icon: Icons.list,
        text: "Orders",
      ),
      _RouteButton(
        icon: Icons.settings_outlined,
        text: "Settings",
      ),
    ]);
  }
}

class _RouteButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String text;
  const _RouteButton({
    Key? key,
    this.isSelected = false,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: isSelected ? theme.colorScheme.primary.withAlpha(10) : Colors.transparent,
      child: InkWell(
        onTap: () {},
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
