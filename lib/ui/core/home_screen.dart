import 'package:avencia/logic/features/auth/auth_facade.dart';
import 'package:flutter/material.dart';

import '../../di.dart';
import '../features/deposit/deposit_code_page.dart';

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
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DepositCodePage())),
              child: Text("Deposit"),
            ),
            TextButton(
              onPressed: sl<AuthFacade>().logout,
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
