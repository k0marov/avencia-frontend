import 'package:avencia/ui/features/new/dashboard/icon_with_text.dart';
import 'package:avencia/ui/features/new/icon_text_button.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconTextButton(
      onPressed: () {},
      iconWithText: IconWithText(
        icon: Icons.question_mark_outlined,
        text: Text(
          "Support",
          style: theme.textTheme.headline3,
        ),
      ),
    );
  }
}
