import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:flutter/material.dart';

import '../general/themes/theme.dart';
import 'currency_icon.dart';
import 'dashboard_card.dart';

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
                  Text(SupportedCurrencies.getData(currency)?.name ?? currency,
                      style: text.headline5),
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
