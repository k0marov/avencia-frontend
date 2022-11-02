import 'package:flutter/material.dart';

import 'bottom_buttons.dart';
import 'header.dart';
import 'route_buttons.dart';

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
