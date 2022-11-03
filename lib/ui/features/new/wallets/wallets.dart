import 'package:avencia/ui/features/new/currency_icon.dart';
import 'package:avencia/ui/features/new/dashboard/custom_icon_button.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_screen.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_section.dart';
import 'package:avencia/ui/features/new/dashboard/icon_with_text.dart';
import 'package:avencia/ui/features/new/dashboard/sections/digital_wallets.dart';
import 'package:avencia/ui/features/new/navigation_menu/navigation_menu.dart';
import 'package:avencia/ui/features/new/simple_button.dart';
import 'package:flutter/material.dart';

import '../app_bar.dart';
import '../dashboard/gradient_button.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return Scaffold(
      appBar: createAvenciaAppBar(context),
      drawer: NavigationMenuDrawer(),
      body: Padding(
        padding: screenPadding,
        child: ListView(children: [
          Text("Wallets", style: text.headline2),
          SizedBox(height: sectionSpacing),
          _ActionButtons(),
          SizedBox(height: sectionSpacing),
          _CryptoWallets(),
          SizedBox(height: sectionSpacing),
          _FiatAccounts(),
          SizedBox(height: sectionSpacing),
          _AddNewWallet(),
        ]),
      ),
    );
  }
}

class _CryptoWallets extends StatelessWidget {
  const _CryptoWallets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text("Crypto Accounts", style: Theme.of(context).textTheme.headline4),
        ),
        SizedBox(height: sectionSpacing),
        _WalletSection(
          type: "Wallet",
          currency: "ETH",
          amount: "0.452058 ETH",
          usdAmount: "1,583.25 USD",
        ),
        SizedBox(height: sectionSpacing),
        _WalletSection(
          type: "Wallet",
          currency: "ETH",
          amount: "0.452058 ETH",
          usdAmount: "1,583.25 USD",
        ),
        SizedBox(height: sectionSpacing),
        _WalletSection(
          type: "Wallet",
          currency: "BTC",
          amount: "4.434953 BTC",
          usdAmount: "28,247.63 USD",
        ),
      ],
    );
  }
}

class _FiatAccounts extends StatelessWidget {
  const _FiatAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text("Fiat Accounts", style: Theme.of(context).textTheme.headline4),
      ),
      SizedBox(height: sectionSpacing),
      _WalletSection(
        type: "Account",
        currency: "USD",
        amount: "\$18,340.20",
        usdAmount: "12,495.90 USD",
      ),
      SizedBox(height: sectionSpacing),
      _WalletSection(
        type: "Account",
        currency: "EUR",
        amount: "12,495.90",
        usdAmount: "12,495.90 USD",
      ),
    ]);
  }
}

class _AddNewWallet extends StatelessWidget {
  const _AddNewWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: dashboardSectionBRadius),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(children: [
          SizedBox(
            height: 70,
            child: CustomIconButton(
              iconSize: 25,
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
          SizedBox(height: 20),
          Text("Add New Wallet", style: text.headline3),
          SizedBox(height: 5),
          Text(
            "You can add more wallets to your account to manage funds separately",
            style: text.bodyText1,
          ),
        ]),
      ),
    );
  }
}

class _WalletSection extends StatelessWidget {
  final String type;
  final String currency;
  final String amount;
  final String usdAmount;
  const _WalletSection({
    Key? key,
    required this.type,
    required this.currency,
    required this.amount,
    required this.usdAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return DashboardSection(
      title: Row(children: [
        SizedBox(
          height: 45,
          child: CurrencyIcon(currency: currency),
        ),
        SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(getCurrencyName(currency), style: text.headline3),
          SizedBox(height: 5),
          Text(type, style: text.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
        ])
      ]),
      action: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      content: Container(),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    const spacing = SizedBox(width: 5);
    return Row(children: [
      SizedBox(
        width: 75,
        child: SimpleButton(
          onPressed: () {},
          contents: Text("Send"),
        ),
      ),
      spacing,
      Expanded(
        child: SizedBox(
          width: 150,
          child: SimpleButton(
            onPressed: () {},
            contents: IconWithText(
              icon: Icons.arrow_upward,
              text: Text("Withdraw"),
            ),
          ),
        ),
      ),
      spacing,
      Expanded(
        child: GradientButton(
          onPressed: () {},
          content: IconWithText(
            icon: Icons.arrow_downward,
            text: Text("Deposit", style: text.button),
          ),
        ),
      ),
    ]);
  }
}
