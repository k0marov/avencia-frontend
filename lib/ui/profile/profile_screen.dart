import 'package:avencia/di.dart';
import 'package:avencia/ui/user_details/user_details_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(children: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          "My Profile",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 36),
        ),
      ),
      UserDetailsForm(),
      TextButton(
        onPressed: uiDeps.authFacade.logout,
        child: Text("Logout", style: TextStyle(color: Colors.red)),
      ),
    ]));
  }
}
