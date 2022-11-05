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

  static double? getIconSize(TextStyle? style, ThemeData theme) =>
      style != null && style.fontSize != null ? style.fontSize! * 1.2 : theme.iconTheme.size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: text.style?.color ?? theme.iconTheme.color,
          size: getIconSize(text.style, theme),
        ),
        SizedBox(width: 8),
        textOverflows ? Expanded(child: text) : text,
      ],
    );
  }
}
