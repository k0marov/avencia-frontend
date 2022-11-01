import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String? title;
  final Widget content;
  const DashboardCard({
    Key? key,
    this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: title != null
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title!, style: text.headline5),
                content,
              ])
            : content,
      ),
    );
  }
}
