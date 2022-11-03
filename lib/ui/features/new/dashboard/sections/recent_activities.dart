import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/features/new/currency_icon.dart';
import 'package:flutter/material.dart';

import '../dashboard_section.dart';

class RecentAcitvitiesSection extends StatelessWidget {
  const RecentAcitvitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const actionsSpacing = SizedBox(height: 15);
    return DashboardSection(
      title: "Recent Activities",
      action: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      content: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextButton(
          onPressed: () {},
          child: Text("Buy"),
          style: TextButton.styleFrom(
            backgroundColor: AppColors.purpleHighlight,
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
        _ActionWidget(
          currency: "BTC",
          action: "Buy Bitcoin",
          date: "26m ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        _ActionWidget(
          currency: "ETH",
          action: "Withdraw",
          date: "3d 2h ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        _ActionWidget(
          currency: "BTC",
          action: "Buy Bitcoin",
          date: "26m ago",
          usdAmount: "3,980.93 USD",
          amount: "0.5384 BTC",
        ),
        actionsSpacing,
        _ActionWidget(
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

class _ActionWidget extends StatelessWidget {
  final String action;
  final String currency;
  final String date;
  final String usdAmount;
  final String amount;
  const _ActionWidget({
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
        SizedBox(height: 2),
        Text(date, style: text.bodyText2),
        SizedBox(height: 2),
        Text(usdAmount, style: text.bodyText2),
        SizedBox(height: 2),
        Text(amount, style: text.bodyText2),
      ],
    );
  }
}
