import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final Text text;
  final bool textOverflows;
  const IconWithText({
    Key? key,
    required this.text,
    required this.icon,
    this.textOverflows = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: text.style?.color,
          size: text.style != null && text.style?.fontSize != null
              ? text.style!.fontSize! * 1.2
              : null,
        ),
        SizedBox(width: 8),
        textOverflows ? Expanded(child: text) : text,
      ],
    );
  }
}
