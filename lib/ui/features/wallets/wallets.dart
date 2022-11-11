import 'package:avencia/di.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:avencia/ui/features/wallets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/simple_cubit.dart';
import 'package:helpers/ui/errors/state_switch.dart';

import 'header.dart';
import 'wallet_section.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return uiDeps.simpleBuilder<Wallets>(
      load: uiDeps.getWallets,
      loadingBuilder: () => SimpleScreen(
        title: "Wallets",
        contentBuilder: (_) => loadingWidget,
      ),
      loadedBuilder: (_, cubit) => SimpleScreen(
        title: "Wallets",
        onRefresh: cubit.refresh,
        contentBuilder: (_) => Column(
          children: [
            ActionButtons(),
            _Wallets(),
            AddNewWallet(),
          ].withSpaceBetween(height: ThemeConstants.sectionSpacing),
        ),
      ),
    );
  }
}

// TODO: add a placeholder if there is no wallets

class _Wallets extends StatelessWidget {
  const _Wallets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<SimpleCubit<Wallets>>().state;
    final wallets = state.assertLoaded();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text("Crypto Accounts", style: Theme.of(context).textTheme.headline4),
        ),
        ...wallets.wallets.map((w) => WalletSection(
              walletId: w.id,
              type: "Wallet",
              currency: w.money.currency,
              amount: w.money.amount.toString(),
              usdAmount: "42",
            )),
      ].withSpaceBetween(height: ThemeConstants.cardSpacing),
    );
  }
}
