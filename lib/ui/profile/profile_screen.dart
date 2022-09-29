import 'package:avencia/di.dart';
import 'package:avencia/ui/user_details/user_details_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      TextButton(
        onPressed: uiDeps.authFacade.logout,
        child: Text("Logout", style: TextStyle(color: Colors.red)),
      ),
      UserDetailsForm(),
    ]));
  }
}
