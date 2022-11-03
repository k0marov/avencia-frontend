import 'package:avencia/ui/features/new/dashboard/icon_with_text.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.all(Radius.circular(20));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: IconWithText(
                text: "Support",
                icon: Icons.question_mark_outlined,
                style: theme.textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
