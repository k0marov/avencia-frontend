import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/simple_cubit.dart';

import '../../../../logic/features/dashboard/internal/values.dart';
import '../../../core/widgets/wallet_card.dart';
import '../section_widget.dart';

class DigitalWalletsSection extends StatelessWidget {
  const DigitalWalletsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<SimpleCubit<FullUserInfo>>().state;
    final wallets = state.assertLoaded().wallets;
    return SectionWidget(
      title: Text("Digital Wallets"),
      action: TextButton(
        onPressed: () {},
        child: Text("View All"),
      ),
      content: Column(children: wallets.wallets.map((w) => WalletCard(w: w)).toList()),
    );
  }
}
