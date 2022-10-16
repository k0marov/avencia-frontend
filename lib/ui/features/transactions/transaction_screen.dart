import 'package:avencia/ui/features/transactions/transaction_code_widget.dart';
import 'package:avencia/ui/features/transactions/transfer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/features/transactions/internal/values.dart';
import '../../../logic/features/transactions/state_management/transaction_screen_cubit/transaction_screen_cubit.dart';
import '../../core/app/logo_widget.dart';
import '../../core/buttons/gradient_button.dart';

// TODO: refactor this

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  List<Widget> _getMainChildren(TransactionScreenState state, TransactionScreenCubit b) {
    switch (state) {
      case TransactionScreenState.initial:
        return [
          GradientButton(
            onPressed: b.depositPressed,
            text: "DEPOSIT",
          ),
          const SizedBox(height: 25),
          GradientButton(
            onPressed: b.withdrawPressed,
            text: "WITHDRAW",
          ),
          const SizedBox(height: 25),
          GradientButton(
            onPressed: b.transferPressed,
            text: "TRANSFER",
          ),
        ];
      case TransactionScreenState.depositing:
        return [
          const TransactionCodeWidget(
            type: TransactionType.deposit,
          ),
        ];
      case TransactionScreenState.withdrawing:
        return [
          const TransactionCodeWidget(
            type: TransactionType.withdrawal,
          ),
        ];
      case TransactionScreenState.transfering:
        return [
          const TransferWidget(),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider<TransactionScreenCubit>(
        create: (_) => TransactionScreenCubit(),
        child: BlocBuilder<TransactionScreenCubit, TransactionScreenState>(
          builder: (context, state) => ListView(
            children: [
              const SizedBox(height: 100),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: LogoWidget(),
              ),
              if (state == TransactionScreenState.initial) ...[
                Text(
                  "Welcome!",
                  style: (Theme.of(context).textTheme.displaySmall ?? const TextStyle()).copyWith(
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45),
              ],
              ..._getMainChildren(state, context.read<TransactionScreenCubit>()),
            ],
          ),
        ),
      ),
    );
  }
}
