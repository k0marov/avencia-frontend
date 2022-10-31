import 'package:avencia/ui/features/dashboard/app_bar.dart';
import 'package:avencia/ui/features/dashboard/gradient_button.dart';
import 'package:avencia/ui/features/dashboard/simple_button.dart';
import 'package:flutter/material.dart';

import 'dashboard_card.dart';
import 'dashboard_section.dart';

const _sectionSpacing = 15.0;
const _cardSpacing = 12.0;
const _buttonSize = 40.0;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Scaffold(
      appBar: createAvenciaAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: ListView(
          children: [
            Text("Dashboard", style: text.headline1),
            const SizedBox(height: _sectionSpacing),
            DashboardSection(
              title: "Overview",
              action: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              ),
              content: Column(
                children: const [
                  BalanceCard(),
                  SizedBox(height: _cardSpacing),
                  TransactionsCard(),
                  SizedBox(height: _cardSpacing),
                  WalletsCard(),
                  SizedBox(height: _cardSpacing),
                  LastActivityCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

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
          height: _buttonSize,
          child: Row(children: [
            SimpleButton(
              onPressed: () {},
              icon: Icons.settings,
            ),
            SizedBox(width: itemsSpacing),
            SimpleButton(
              onPressed: () {},
              icon: Icons.compare_arrows,
            ),
            SizedBox(width: itemsSpacing),
            GradientButton(
              onPressed: () {},
              content: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Row(children: [
                  Icon(
                    Icons.arrow_downward,
                    // TODO: remove the need for specifying the style of gradient button's contents
                    //  by overriding the default theme inside GradientButton
                    color: theme.textTheme.button?.color,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Deposit",
                    style: text.button,
                  )
                ]),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({Key? key}) : super(key: key);

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
            width: _buttonSize,
            height: _buttonSize,
            child: SimpleButton(
              onPressed: () {},
              icon: Icons.send,
            ),
          ),
        ]));
  }
}

class WalletsCard extends StatelessWidget {
  const WalletsCard({Key? key}) : super(key: key);

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
          width: _buttonSize,
          height: _buttonSize,
          child: SimpleButton(
            onPressed: () {},
            icon: Icons.wallet,
          ),
        )
      ]),
    );
  }
}

class LastActivityCard extends StatelessWidget {
  const LastActivityCard({Key? key}) : super(key: key);

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
