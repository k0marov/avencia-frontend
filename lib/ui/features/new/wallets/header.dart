import 'package:avencia/ui/core/app/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../gradient_button.dart';
import '../icon_with_text.dart';
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
          onPressed: () => context.go(Routes.transfer.path),
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
