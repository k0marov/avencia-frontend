import 'package:flutter/material.dart';

// TODO: maybe get rid of this widget
class CustomIconButton extends StatelessWidget {
  final void Function() onPressed;
  final double? iconSize;
  final IconData icon;
  final Color? color;
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.color,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        onPressed: onPressed,
        iconSize: iconSize,
        icon: Icon(icon),
      ),
    );
  }
}
