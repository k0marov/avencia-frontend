import 'package:flutter/material.dart';

import '../../../core/widgets/custom_icon_button.dart';
import '../dashboard/section_widget.dart';

class AddNewWallet extends StatelessWidget {
  const AddNewWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: sectionBRadius),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(children: [
          SizedBox(
            height: 70,
            child: CustomIconButton(
              iconSize: 25,
              onPressed: () {},
              icon: Icons.add,
            ),
          ),
          SizedBox(height: 20),
          Text("Add New Wallet", style: text.headline3),
          SizedBox(height: 5),
          Text(
            "You can add more wallets to your account to manage funds separately",
            style: text.bodyText1,
          ),
        ]),
      ),
    );
  }
}
