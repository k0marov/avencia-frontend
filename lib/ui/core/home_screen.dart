import 'package:flutter/material.dart';

import 'flat_color_button.dart';
import 'gradient_button.dart';
import 'logo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: LogoWidget(),
            ),
            Text(
              "Welcome!",
              style: (Theme.of(context).textTheme.displaySmall ?? TextStyle()).copyWith(
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 35),
            GradientButton(
              onPressed: () {},
              text: "DEPOSIT",
            ),
            SizedBox(height: 25),
            GradientButton(
              onPressed: () {},
              text: "WITHDRAW",
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 6),
              child: Divider(
                thickness: 4,
              ),
            ),
            FlatColorButton(),
          ],
        ),
      ),
    );
  }
}
