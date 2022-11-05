import 'package:avencia/ui/core/general/helpers.dart';
import 'package:flutter/material.dart';

import 'currency_icon.dart';

class HistoryEntryWidget extends StatelessWidget {
  final String action;
  final String currency;
  final String date;
  final String usdAmount;
  final String amount;
  const HistoryEntryWidget({
    Key? key,
    required this.action,
    required this.currency,
    required this.date,
    required this.usdAmount,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
              child: CurrencyIcon(currency: currency),
            ),
            SizedBox(width: 5),
            Text(action, style: text.headline3),
          ],
        ),
        Text(date, style: text.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
        Text(usdAmount, style: text.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
        Text(amount, style: text.bodyText2),
      ].withSpaceBetween(height: 5),
    );
  }
}
