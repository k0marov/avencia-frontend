import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final void Function() onPressed;
  final double? iconSize;
  final IconData icon;
  const SimpleButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.whiteButton,
        ),
        onPressed: onPressed,
        iconSize: iconSize,
        icon: Icon(icon),
      ),
    );
  }
}
