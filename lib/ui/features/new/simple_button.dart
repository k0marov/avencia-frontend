import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final Widget contents;
  final void Function() onPressed;
  final BorderRadius? borderRadius;
  final Color? background;
  const SimpleButton({
    Key? key,
    required this.onPressed,
    required this.contents,
    this.borderRadius,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayBRadius = borderRadius ?? const BorderRadius.all(Radius.circular(20));
    return Material(
      color: background ?? Theme.of(context).colorScheme.onSecondaryContainer,
      borderRadius: displayBRadius,
      child: InkWell(
        borderRadius: displayBRadius,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.headline4 ?? TextStyle(),
              child: contents,
            ),
          ),
        ),
      ),
    );
  }
}
