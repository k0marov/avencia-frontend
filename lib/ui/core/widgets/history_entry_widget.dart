import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/features/history/internal/entities.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:flutter/material.dart';

import '../../../logic/features/history/internal/values.dart';
import 'currency_icon.dart';

// TODO: move all of the string formatting operations to its own module

String entryAction(HistoryEntry entry) {
  if (entry.source.type == TransactionSourceType.transfer) {
    return "Transfer";
  } else {
    return entry.money.amount > 0 ? "Deposit" : "Withdrawal";
  }
}

String formatDate(DateTime dt) {
  final diff = DateTime.now().difference(dt);
  if (diff.inHours > 0) {
    return (diff.inDays > 0 ? "${diff.inDays}d " : "") + "${diff.inHours % 24}h ago";
  } else {
    return "${diff.inMinutes + 1}m ago";
  }
}

String getInDollars(Money m) => "0 USD";

class HistoryEntryWidget extends StatelessWidget {
  final HistoryEntry entry;
  const HistoryEntryWidget({
    Key? key,
    required this.entry,
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
              child: CurrencyIcon(currency: entry.money.currency),
            ),
            SizedBox(width: 5),
            Text(entryAction(entry), style: text.headline3),
          ],
        ),
        Text(formatDate(entry.transactedAt),
            style: text.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
        Text(getInDollars(entry.money),
            style: text.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
        Text("${entry.money.amount} ${entry.money.currency}", style: text.bodyText2),
      ].withSpaceBetween(height: 5),
    );
  }
}
