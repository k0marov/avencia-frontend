import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

import '../../core/widgets/currency_icon.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/wallet_card.dart';
import '../dashboard/section_widget.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleScreen(
      title: "Transfer",
      contentBuilder: (_) => Column(
        children: [
          _RecipientSection(),
          _WalletsSection(),
          _SendSection(currency: "ETH"),
        ],
      ),
    );
  }
}

class _RecipientSection extends StatelessWidget {
  const _RecipientSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: Text("Recipient"),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CustomTextField(
          updValue: (_) {},
          label: "recipient username",
          hint: "type in the recipient username",
          initial: Right(""),
        ),
      ),
    );
  }
}

// TODO: make it a drop down via the action button
class _WalletsSection extends StatelessWidget {
  const _WalletsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: Text("Wallet"),
      action: IconButton(
        onPressed: () {},
        iconSize: 32,
        icon: Icon(
          Icons.keyboard_arrow_down,
        ),
      ),
      content: Column(children: [
        WalletCard(currency: 'ETH', balance: "38.987421 ETH"),
        WalletCard(
          currency: 'BTC',
          balance: "38.987421 BTC",
          isSelected: true,
        ),
        WalletCard(currency: "ETH", balance: "0.836725275 BTC"),
        WalletCard(currency: "BTC", balance: "0.836725275 BTC"),
      ]),
    );
  }
}

class _SendSection extends StatelessWidget {
  final String currency;
  const _SendSection({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: Text("Send"),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CurrencyIcon(currency: currency),
                  ),
                  updValue: (_) {},
                  hint: "amount to send",
                  initial: Right(""),
                ),
              ),
              SizedBox(
                width: 100,
                child: GradientButton(
                  onPressed: () {},
                  content: Text("Send"),
                ),
              ),
            ].withSpaceBetween(width: 10),
          ),
        ),
      ),
    );
  }
}
