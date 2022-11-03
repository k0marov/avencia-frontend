import 'package:avencia/ui/features/new/dashboard/icon_with_text.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconWithText iconWithText;
  final void Function() onPressed;
  const IconTextButton({
    Key? key,
    required this.onPressed,
    required this.iconWithText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(Radius.circular(20));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: iconWithText,
            ),
          ),
        ),
      ),
    );
  }
}
