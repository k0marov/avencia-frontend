import 'package:avencia/ui/features/new/transfer/transfer_screen.dart';
import 'package:flutter/material.dart';

import '../dashboard/gradient_button.dart';
import '../dashboard/icon_with_text.dart';
import '../simple_button.dart';

// TODO: add usage of the dependency-getter files like theme.dart everywhere

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    const spacing = SizedBox(width: 5);
    return Row(children: [
      SizedBox(
        width: 75,
        child: SimpleButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => TransferScreen(),
            ),
          ),
          contents: Text("Send"),
        ),
      ),
      spacing,
      Expanded(
        child: SizedBox(
          width: 150,
          child: SimpleButton(
            onPressed: () {},
            contents: IconWithText(
              icon: Icons.arrow_upward,
              text: Text("Withdraw"),
            ),
          ),
        ),
      ),
      spacing,
      Expanded(
        child: GradientButton(
          onPressed: () {},
          content: IconWithText(
            icon: Icons.arrow_downward,
            text: Text("Deposit"),
          ),
        ),
      ),
    ]);
  }
}
