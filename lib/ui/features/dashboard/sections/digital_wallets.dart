import 'package:flutter/material.dart';

import '../dashboard_card.dart';
import '../dashboard_section.dart';

class DigitalWalletsSection extends StatelessWidget {
  const DigitalWalletsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: "Digital Wallets",
      action: TextButton(
        onPressed: () {},
        child: Text("View All"),
      ),
      content: Column(children: [
        _WalletCard(currency: "BTC", balance: "0.836725275 BTC"),
        _WalletCard(currency: "ETH", balance: "0.836725275 BTC"),
        _WalletCard(currency: "BTC", balance: "0.836725275 BTC"),
      ]),
    );
  }
}

class _WalletCard extends StatelessWidget {
  final String currency;
  final String balance;
  const _WalletCard({
    Key? key,
    required this.currency,
    required this.balance,
  }) : super(key: key);

  // String _getCurrencyImageAsset(String currency) {
  //   return "assets/currencies/$currency.png";
  // }

  String _getCurrencyName(String currencyCode) {
    if (currencyCode == "BTC") return "Bitcoin";
    if (currencyCode == "ETH") return "Ethereum";
    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return SizedBox(
      height: 80,
      child: DashboardCard(
        content: Row(
          children: [
            Text(currency),
            SizedBox(width: 10),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_getCurrencyName(currency), style: text.headline5),
                  Text(balance, style: text.bodyText1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
