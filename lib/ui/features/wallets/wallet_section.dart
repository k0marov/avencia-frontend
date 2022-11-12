import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:avencia/logic/features/transactions/internal/values.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:avencia/ui/core/widgets/history_entry_widget.dart';
import 'package:avencia/ui/features/transactions/transaction_screen.dart';
import 'package:avencia/ui/features/transfer/transfer_screen.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/card_with_buttons.dart';
import '../../core/widgets/currency_icon.dart';
import '../../core/widgets/icon_with_text.dart';
import '../dashboard/section_widget.dart';

class WalletSection extends StatelessWidget {
  final Wallet wallet;
  const WalletSection({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    return SectionWidget(
      title: Row(children: [
        SizedBox(
          height: 45,
          child: CurrencyIcon(currency: wallet.money.currency),
        ),
        SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(SupportedCurrencies.getData(wallet.money.currency)?.name ?? wallet.money.currency,
              style: text.headline3),
          SizedBox(height: 5),
          Text("Wallet", style: text.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
        ])
      ]),
      action: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CardWithButtons(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text(wallet.money.amount.toString(), style: text.headline2),
              Text(getInDollars(wallet.money), style: text.headline4),
            ]),
          ),
          buttons: [
            ButtonData(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TransferScreen(
                        initialWallet: wallet,
                      ))),
              contents: Text("Send", style: text.bodyText2),
            ),
            ButtonData(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionScreen(
                    trans: MetaTransaction(TransactionType.withdrawal, wallet.id),
                  ),
                ),
              ),
              contents: IconWithText(
                icon: Icons.arrow_upward,
                text: Text("Withdraw", style: text.bodyText2),
              ),
            ),
            ButtonData(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionScreen(
                    trans: MetaTransaction(TransactionType.deposit, wallet.id),
                  ),
                ),
              ),
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
