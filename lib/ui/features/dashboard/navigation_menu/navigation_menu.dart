import 'package:avencia/ui/features/dashboard/navigation_menu/bottom_buttons.dart';
import 'package:avencia/ui/features/dashboard/navigation_menu/route_buttons.dart';
import 'package:flutter/material.dart';

import 'header.dart';

class NavigationMenuDrawer extends StatelessWidget {
  const NavigationMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            NavigationHeader(),
            SizedBox(height: 20),
            RouteButtons(),
            SizedBox(height: 20),
            BottomButtons(),
          ],
        ),
      ),
    );
  }
}
