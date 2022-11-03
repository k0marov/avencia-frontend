import 'package:flutter/material.dart';

final dashboardSectionBRadius = BorderRadius.circular(25);

class DashboardSection extends StatelessWidget {
  final Widget title;
  final Widget action;
  final Widget content;

  const DashboardSection({
    Key? key,
    required this.title,
    required this.action,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Material(
      elevation: 2,
      color: theme.backgroundColor,
      borderRadius: dashboardSectionBRadius,
      shadowColor: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              DefaultTextStyle(
                style: text.headline4 ?? TextStyle(),
                child: title,
              ),
              Spacer(),
              action,
            ]),
            content,
          ],
        ),
      ),
    );
  }
}
