import 'package:flutter/material.dart';

final sectionBRadius = BorderRadius.circular(25);

class SectionWidget extends StatelessWidget {
  final Widget title;
  final Widget? action;
  final Widget content;
  final EdgeInsets? padding;

  const SectionWidget({
    Key? key,
    required this.title,
    this.action,
    required this.content,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Material(
      elevation: 2,
      color: theme.colorScheme.primaryContainer,
      borderRadius: sectionBRadius,
      shadowColor: Colors.black,
      child: Padding(
        padding: padding ?? EdgeInsets.only(top: 8, bottom: 14, right: 14, left: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: text.headline3 ?? TextStyle(),
                  child: title,
                ),
              ),
              Spacer(),
              if (action != null) action!,
            ]),
            content,
          ],
        ),
      ),
    );
  }
}
