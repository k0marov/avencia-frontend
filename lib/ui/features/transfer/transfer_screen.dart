import 'package:avencia/di.dart';
import 'package:avencia/logic/features/transfer/state_management/transfer_cubit.dart';
import 'package:avencia/ui/core/general/helpers.dart';
import 'package:avencia/ui/core/general/themes/theme.dart';
import 'package:avencia/ui/core/widgets/simple_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/simple_cubit.dart';
import 'package:helpers/ui/errors/state_switch.dart';
import 'package:helpers/ui/forms/custom_text_field.dart';

import '../../../logic/features/wallets/internal/values.dart';
import '../../core/widgets/currency_icon.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/wallet_card.dart';
import '../dashboard/section_widget.dart';

class TransferScreen extends StatelessWidget {
  final Wallet? initialWallet;
  const TransferScreen({Key? key, this.initialWallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return uiDeps.simpleBuilder<Wallets>(
      load: uiDeps.getWallets,
      loadingBuilder: () => SimpleScreen(
          title: "Transfer",
          contentBuilder: (_) => AspectRatio(aspectRatio: 1, child: loadingWidget)),
      loadedBuilder: (_, cubit) => SimpleScreen(
        title: "Transfer",
        onRefresh: cubit.refresh,
        contentBuilder: (_) => BlocProvider<TransferCubit>(
          create: (_) => uiDeps.transferCubitFactory(initialWallet),
          child: BlocListener<TransferCubit, TransferState>(
            listener: (context, state) => state.sendState.fold(
                () {},
                (s) => s.fold((e) {}, (sent) {
                      if (sent) {
                        context.read<SimpleCubit<Wallets>>().refresh();
                        Navigator.of(context).pop();
                      }
                    })),
            child: BlocBuilder<TransferCubit, TransferState>(
              builder: (context, state) {
                return Column(
                  children: [
                    _RecipientSection(),
                    _WalletsSection(),
                    _SendSection(),
                  ].withSpaceBetween(height: ThemeConstants.sectionSpacing),
                );
              },
            ),
          ),
        ),
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
          updValue: context.read<TransferCubit>().recipientChanged,
          label: "recipient email",
          hint: "type in the recipient email",
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
    final state = context.read<SimpleCubit<Wallets>>().state;
    final wallets = state.assertLoaded();
    final transferCubit = context.read<TransferCubit>();
    return SectionWidget(
      title: Text("Wallet"),
      action: IconButton(
        onPressed: transferCubit.walletsShowToggled,
        iconSize: 32,
        icon: Icon(
          transferCubit.state.walletsShown ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
        ),
      ),
      content: Column(
        children: (transferCubit.state.walletsShown
                ? wallets.wallets
                : wallets.wallets.where((w) => w == transferCubit.state.data.myWallet))
            .map(
              (w) => InkWell(
                onTap: () => transferCubit.walletChanged(w),
                child: WalletCard(
                  w: w,
                  isSelected: w == transferCubit.state.data.myWallet,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SendSection extends StatelessWidget {
  const _SendSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TransferCubit>();
    return SectionWidget(
      title: Text("Send"),
      action: cubit.state.sendState.fold(
        () => CircularProgressIndicator(),
        (some) => some.fold(
          (e) => ExceptionWidget(exception: e),
          (r) => null,
        ),
      ),
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
                    child: CurrencyIcon(currency: cubit.state.data.myWallet.money.currency),
                  ),
                  updValue: (val) => cubit.amountChanged(double.tryParse(val) ?? 0),
                  hint: "amount to send",
                  initial: Right(""),
                ),
              ),
              SizedBox(
                width: 100,
                child: GradientButton(
                  onPressed: cubit.sendPressed,
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
