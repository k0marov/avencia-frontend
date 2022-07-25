import 'package:avencia/config/const.dart';
import 'package:avencia/ui/transactions/transaction_code_widget.dart';
import 'package:avencia/ui/transactions/transfer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/transactions/presentation/transaction_screen_cubit/transaction_screen_cubit.dart';
import '../core/gradient_button.dart';
import '../core/logo_widget.dart';

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
          SizedBox(height: 25),
          GradientButton(
            onPressed: b.withdrawPressed,
            text: "WITHDRAW",
          ),
          SizedBox(height: 25),
          GradientButton(
            onPressed: b.transferPressed,
            text: "TRANSFER",
          ),
        ];
      case TransactionScreenState.depositing:
        return [
          TransactionCodeWidget(
            type: TransactionType.deposit,
          ),
        ];
      case TransactionScreenState.withdrawing:
        return [
          TransactionCodeWidget(
            type: TransactionType.withdrawal,
          ),
        ];
      case TransactionScreenState.transfering:
        return [
          TransferWidget(),
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
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: LogoWidget(),
              ),
              if (state == TransactionScreenState.initial) ...[
                Text(
                  "Welcome!",
                  style: (Theme.of(context).textTheme.displaySmall ?? TextStyle()).copyWith(
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 45),
              ],
              ..._getMainChildren(state, context.read<TransactionScreenCubit>()),
            ],
          ),
        ),
      ),
    );
  }
}
