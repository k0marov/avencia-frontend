import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:flutter/material.dart';

import 'header.dart';
import 'wallet_section.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleScreen(
      title: "Wallets",
      contents: [
        ActionButtons(),
        _Wallets(),
        // _FiatAccounts(),
      ],
    );
  }
}

class _Wallets extends StatelessWidget {
  const _Wallets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text("Crypto Accounts", style: Theme.of(context).textTheme.headline4),
        ),
        SizedBox(height: 5),
        WalletSection(
          type: "Wallet",
          currency: "ETH",
          amount: "0.452058 ETH",
          usdAmount: "1,583.25 USD",
        ),
        SizedBox(height: ThemeConstants.sectionSpacing),
        WalletSection(
          type: "Wallet",
          currency: "ETH",
          amount: "0.452058 ETH",
          usdAmount: "1,583.25 USD",
        ),
        SizedBox(height: ThemeConstants.sectionSpacing),
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
