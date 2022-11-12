import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:avencia/logic/features/currencies/values.dart';
import 'package:avencia/ui/core/widgets/currency_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../di.dart';
import '../../../logic/features/wallets/internal/values.dart';

void showWalletAddingDialog(BuildContext context) {
  final theme = Theme.of(context);
  final text = theme.textTheme;
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text("Add wallet", style: text.headline2),
      children: [
        Text(
          "Select Currency",
          style: text.headline3,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 300,
          width: 500,
          child: ListView(
            children: SupportedCurrencies.currencies
                .map(
                  (c) => _SelectCurrencyWidget(currency: c),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );
}

// TODO: deal with screen refreshing

class _SelectCurrencyWidget extends StatelessWidget {
  final CurrencyData currency;
  const _SelectCurrencyWidget({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InkWell(
        onTap: () async {
          // TODO: implement showing an error message
          Navigator.of(context).pop();
          await uiDeps.createWallet(
            WalletCreationVal(currency: currency.code),
          );
          // context.read<SimpleCubit<Wallets>>().refresh();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Row(children: [
            CurrencyIcon(currency: currency.code),
            SizedBox(width: 10),
            Text(currency.name, style: Theme.of(context).textTheme.headline4),
          ]),
        ),
      ),
    );
  }
}
