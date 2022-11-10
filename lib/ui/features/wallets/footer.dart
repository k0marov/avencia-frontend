import 'package:avencia/di.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/simple_cubit.dart';

import '../../core/widgets/custom_icon_button.dart';
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
              onPressed: () async {
                // TODO: implement selecting a currency and showing an error message
                await uiDeps.createWallet(
                  WalletCreationVal(currency: "ETH"),
                );
                context.read<SimpleCubit<Wallets>>().refresh();
              },
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
