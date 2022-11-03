import 'package:avencia/ui/features/new/dashboard/dashboard_screen.dart';
import 'package:avencia/ui/features/new/navigation_menu/navigation_menu.dart';
import 'package:flutter/material.dart';

import '../app_bar.dart';
import 'footer.dart';
import 'header.dart';
import 'wallet_section.dart';

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
          ActionButtons(),
          SizedBox(height: sectionSpacing),
          _CryptoWallets(),
          SizedBox(height: sectionSpacing),
          _FiatAccounts(),
          SizedBox(height: sectionSpacing),
          AddNewWallet(),
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
        WalletSection(
          type: "Wallet",
          currency: "ETH",
          amount: "0.452058 ETH",
          usdAmount: "1,583.25 USD",
        ),
        SizedBox(height: sectionSpacing),
        WalletSection(
          type: "Wallet",
          currency: "ETH",
          amount: "0.452058 ETH",
          usdAmount: "1,583.25 USD",
        ),
        SizedBox(height: sectionSpacing),
        WalletSection(
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
      WalletSection(
        type: "Account",
        currency: "USD",
        amount: "\$18,340.20",
        usdAmount: "12,495.90 USD",
      ),
      SizedBox(height: sectionSpacing),
      WalletSection(
        type: "Account",
        currency: "EUR",
        amount: "12,495.90",
        usdAmount: "12,495.90 USD",
      ),
    ]);
  }
}
