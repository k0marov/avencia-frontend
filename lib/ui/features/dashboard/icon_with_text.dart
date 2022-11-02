import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle? style;
  const IconWithText({
    Key? key,
    required this.text,
    required this.icon,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: style?.color,
          size: style != null && style?.fontSize != null ? style!.fontSize! * 1.2 : null,
        ),
        SizedBox(width: 8),
        Text(text, style: style),
      ],
    );
  }
}
