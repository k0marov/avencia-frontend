import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/features/new/currency_icon.dart';
import 'package:flutter/material.dart';

import '../dashboard_card.dart';
import '../dashboard_section.dart';

class DigitalWalletsSection extends StatelessWidget {
  const DigitalWalletsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: Text("Digital Wallets"),
      action: TextButton(
        onPressed: () {},
        child: Text("View All"),
      ),
      content: Column(children: [
        WalletCard(currency: "RUU", balance: "0.836725275 BTC"),
        WalletCard(currency: "ETH", balance: "0.836725275 BTC"),
        WalletCard(currency: "BTC", balance: "0.836725275 BTC"),
      ]),
    );
  }
}

String getCurrencyName(String currencyCode) {
  if (currencyCode == "BTC") return "Bitcoin";
  if (currencyCode == "ETH") return "Etherium";
  return currencyCode;
}

class WalletCard extends StatelessWidget {
  final String currency;
  final String balance;
  final bool isSelected;
  const WalletCard({
    Key? key,
    required this.currency,
    required this.balance,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    final card = SizedBox(
      height: 80,
      child: DashboardCard(
        content: Row(
          children: [
            CurrencyIcon(currency: currency),
            SizedBox(width: 10),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(getCurrencyName(currency), style: text.headline5),
                  Text(balance, style: text.bodyText1),
                ],
              ),
            )
          ],
        ),
      ),
    );
    return isSelected
        ? Theme(
            data: theme.copyWith(
              cardTheme: theme.cardTheme.copyWith(
                // color: theme.colorScheme.primary.withAlpha(5),
                shape: RoundedRectangleBorder(
                  borderRadius: ThemeConstants.cardBRadius,
                  side: BorderSide(color: theme.colorScheme.primary, width: 4),
                ),
              ),
            ),
            child: card,
          )
        : card;
  }
}
