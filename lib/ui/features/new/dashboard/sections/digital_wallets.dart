import 'package:flutter/material.dart';

import '../../wallet_card.dart';
import '../section_widget.dart';

class DigitalWalletsSection extends StatelessWidget {
  const DigitalWalletsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
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
