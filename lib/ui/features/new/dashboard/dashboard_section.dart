import 'package:flutter/material.dart';

final dashboardSectionBRadius = BorderRadius.circular(25);

class DashboardSection extends StatelessWidget {
  final Widget title;
  final Widget? action;
  final Widget content;
  final EdgeInsets? padding;

  const DashboardSection({
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
      borderRadius: dashboardSectionBRadius,
      shadowColor: Colors.black,
      child: Padding(
        padding: padding ?? EdgeInsets.all(14),
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
