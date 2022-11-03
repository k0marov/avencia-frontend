import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final Widget contents;
  final void Function() onPressed;
  const SimpleButton({
    Key? key,
    required this.onPressed,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(Radius.circular(20));
    return Material(
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
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
