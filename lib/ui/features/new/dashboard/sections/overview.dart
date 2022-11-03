import 'package:flutter/material.dart';

import '../custom_icon_button.dart';
import '../dashboard_card.dart';
import '../dashboard_screen.dart';
import '../dashboard_section.dart';
import '../gradient_button.dart';
import '../icon_with_text.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: Text("Overview"),
      action: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      content: Column(
        children: const [
          _BalanceCard(),
          SizedBox(height: cardSpacing),
          _TransactionsCard(),
          SizedBox(height: cardSpacing),
          _WalletsCard(),
          SizedBox(height: cardSpacing),
          _LastActivityCard(),
          SizedBox(height: cardSpacing),
        ],
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    const itemsSpacing = 15.0;
    return DashboardCard(
      title: "Balance",
      content: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text("\$156,153,517,892", style: text.headline2),
        SizedBox(height: itemsSpacing),
        SizedBox(
          height: buttonSize,
          child: Row(children: [
            CustomIconButton(
              onPressed: () {},
              icon: Icons.settings,
            ),
            SizedBox(width: itemsSpacing),
            CustomIconButton(
              onPressed: () {},
              icon: Icons.compare_arrows,
            ),
            SizedBox(width: itemsSpacing),
            GradientButton(
              onPressed: () {},
              content: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: IconWithText(
                  icon: Icons.arrow_downward,
                  text: Text(
                    "Deposit",
                    style: text.button,
                  ),
                ),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}

class _TransactionsCard extends StatelessWidget {
  const _TransactionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return DashboardCard(
        title: "Transactions",
        content: Row(children: [
          Text("34,405", style: text.headline2),
          Spacer(),
          SizedBox(
            width: buttonSize,
            height: buttonSize,
            child: CustomIconButton(
              onPressed: () {},
              icon: Icons.send,
            ),
          ),
        ]));
  }
}

class _WalletsCard extends StatelessWidget {
  const _WalletsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return DashboardCard(
      title: "Wallets",
      content: Row(children: [
        Text("5", style: text.headline2),
        Spacer(),
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: CustomIconButton(
            onPressed: () {},
            icon: Icons.wallet,
          ),
        )
      ]),
    );
  }
}

class _LastActivityCard extends StatelessWidget {
  const _LastActivityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return DashboardCard(
      title: "Last Activity",
      content: SizedBox(
        width: double.infinity,
        child: Text("19 Nov, 2019", style: text.headline2),
      ),
    );
  }
}
