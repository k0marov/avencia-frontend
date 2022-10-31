import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
  final String title;
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
      elevation: 5,
      color: theme.backgroundColor,
      borderRadius: BorderRadius.circular(25),
      shadowColor: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Text(title, style: text.headline4),
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
