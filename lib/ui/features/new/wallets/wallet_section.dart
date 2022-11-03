import 'package:avencia/ui/features/new/card_with_buttons.dart';
import 'package:avencia/ui/features/new/currency_icon.dart';
import 'package:avencia/ui/features/new/dashboard/dashboard_section.dart';
import 'package:avencia/ui/features/new/dashboard/icon_with_text.dart';
import 'package:avencia/ui/features/new/dashboard/sections/digital_wallets.dart';
import 'package:flutter/material.dart';

class WalletSection extends StatelessWidget {
  final String type;
  final String currency;
  final String amount;
  final String usdAmount;
  const WalletSection({
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
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CardWithButtons(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text(amount, style: text.headline2),
              Text(usdAmount, style: text.headline4),
            ]),
          ),
          buttons: [
            ButtonData(
              onPressed: () {},
              contents: Text("Send", style: text.bodyText2),
            ),
            ButtonData(
              onPressed: () {},
              contents: IconWithText(
                icon: Icons.arrow_upward,
                text: Text("Withdraw", style: text.bodyText2),
              ),
            ),
            ButtonData(
              onPressed: () {},
              contents: IconWithText(
                icon: Icons.arrow_downward,
                text: Text("Deposit", style: text.bodyText2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
