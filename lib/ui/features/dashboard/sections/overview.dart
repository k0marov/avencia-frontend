import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/simple_cubit.dart';

import '../../../core/general/themes/theme.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/dashboard_card.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/icon_with_text.dart';
import '../section_widget.dart';

class OverviewSection extends StatelessWidget {
  // final Wallets wallets;
  const OverviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<SimpleCubit<FullUserInfo>>().state;
    final wallets = state.assertLoaded().wallets;
    return SectionWidget(
      title: Text("Overview"),
      action: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      content: Column(
        children: [
          _BalanceCard(usdBalance: wallets.totalUSD),
          _TransactionsCard(),
          _WalletsCard(
            walletsCount: wallets.wallets.length,
          ),
          _LastActivityCard(),
          SizedBox(height: 5),
        ].withSpaceBetween(height: ThemeConstants.cardSpacing),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  final MoneyAmount usdBalance;
  const _BalanceCard({Key? key, required this.usdBalance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    const itemsSpacing = 15.0;
    return DashboardCard(
      title: "Balance",
      content: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text("\$$usdBalance", style: text.headline2),
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
  final int walletsCount;
  const _WalletsCard({Key? key, required this.walletsCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return DashboardCard(
      title: "Wallets",
      content: Row(children: [
        Text("$walletsCount", style: text.headline2),
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
