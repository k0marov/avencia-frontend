import 'package:avencia/ui/features/new/card_with_buttons.dart';
import 'package:avencia/ui/features/new/currency_icon.dart';
import 'package:flutter/material.dart';

import '../dashboard_section.dart';

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const actionsSpacing = SizedBox(height: 15);
    return DashboardSection(
      title: Text("Recent Activities"),
      action: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      content: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextButton(
          onPressed: () {},
          child: Text("Buy"),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).highlightColor,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Sell"),
        ),
        TextButton(
          onPressed: () {},
          child: Text("All"),
        ),
        SizedBox(height: 18),
        ActionWidget(
          currency: "BTC",
          action: "Buy Bitcoin",
          date: "26m ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        ActionWidget(
          currency: "ETH",
          action: "Withdraw",
          date: "3d 2h ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        ActionWidget(
          currency: "BTC",
          action: "Buy Bitcoin",
          date: "26m ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        ActionWidget(
          currency: "LTC",
          action: "Withdraw",
          date: "3d 2h ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
      ]),
    );
  }
}

class ActionWidget extends StatelessWidget {
  final String action;
  final String currency;
  final String date;
  final String usdAmount;
  final String amount;
  const ActionWidget({
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