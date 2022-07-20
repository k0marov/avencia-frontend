import 'package:avencia/ui/shared/helpers.dart';
import 'package:avencia/ui/transactions/transactions_code_page.dart';
import 'package:flutter/material.dart';

import '../../di.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You are signed in."),
            TextButton(
              onPressed: () => pushRoute(context, DepositCodePage()),
              child: Text("Deposit"),
            ),
            TextButton(
              onPressed: uiDeps.authFacade.logout,
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
