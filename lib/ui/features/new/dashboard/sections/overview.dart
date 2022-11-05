import 'package:avencia/ui/features/new/card_with_buttons.dart';
import 'package:flutter/material.dart';

import '../../../../core/general/themes/theme.dart';
import '../../custom_icon_button.dart';
import '../../dashboard_card.dart';
import '../../gradient_button.dart';
import '../../icon_with_text.dart';
import '../section_widget.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: Text("Overview"),
      action: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      content: Column(
        children: const [
          _BalanceCard(),
          _TransactionsCard(),
          _WalletsCard(),
          _LastActivityCard(),
          SizedBox(height: 5),
        ].withSpaceBetween(height: ThemeConstants.cardSpacing),
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
          height: ThemeConstants.buttonSize,
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
            SizedBox(
              width: 120,
              child: GradientButton(
                onPressed: () {},
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconWithText(
                    icon: Icons.arrow_downward,
                    text: Text("Deposit"),
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
            width: ThemeConstants.buttonSize,
            height: ThemeConstants.buttonSize,
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
          width: ThemeConstants.buttonSize,
          height: ThemeConstants.buttonSize,
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
