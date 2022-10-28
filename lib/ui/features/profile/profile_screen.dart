import 'package:avencia/di.dart';
import 'package:flutter/material.dart';

import '../user/kyc/passport_form.dart';

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
      // const UserDetailsForm(),
      const PassportForm(),
      TextButton(
        onPressed: uiDeps.authFacade.logout,
        child: const Text("Logout", style: TextStyle(color: Colors.red)),
      ),
    ]));
  }
}
