import 'package:avencia/ui/features/new/icon_with_text.dart';
import 'package:avencia/ui/features/new/simple_button.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SimpleButton(
        onPressed: () {},
        contents: IconWithText(
          icon: Icons.question_mark_outlined,
          text: Text(
            "Support",
            style: theme.textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
