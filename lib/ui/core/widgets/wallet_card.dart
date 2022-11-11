import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:flutter/material.dart';

import '../general/themes/theme.dart';
import 'currency_icon.dart';
import 'dashboard_card.dart';

class WalletCard extends StatelessWidget {
  final Wallet w;
  final bool isSelected;
  const WalletCard({
    Key? key,
    required this.w,
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
            CurrencyIcon(currency: w.money.currency),
            SizedBox(width: 10),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(SupportedCurrencies.getData(w.money.currency)?.name ?? w.money.currency,
                      style: text.headline5),
                  Text("${w.money.amount} ${w.money.currency}", style: text.bodyText1),
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
