import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';
import '../../../logic/core/money.dart';
import '../../../logic/features/transactions/state_management/transaction_screen_cubit/transaction_screen_cubit.dart';
import '../../../logic/features/transfer/internal /transfer_data.dart';
import '../../../logic/features/transfer/state_management/transfer_cubit.dart';
import '../../core/buttons/gradient_button.dart';

class TransferWidget extends StatelessWidget {
  const TransferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (_) => uiDeps.transferCubitFactory(),
        child: BlocBuilder<TransferCubit, TransferState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: context.read<TransferCubit>().emailChanged,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: TextFormField(
                        onChanged: context.read<TransferCubit>().currencySelected,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9\.]"))],
                        onChanged: (amount) => context
                            .read<TransferCubit>()
                            .amountChanged(double.tryParse(amount) ?? 0),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Amount",
                        ),
                      ),
                    ),
                  ],
                ),
                if (state.exception != null) Text(state.exception.toString()),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GradientButton(
                      width: 150,
                      onPressed: context.read<TransactionScreenCubit>().finishPressed,
                      text: "CANCEL",
                    ),
                    const Spacer(),
                    GradientButton(
                      onPressed: () async {
                        final result = await uiDeps.transfer(
                          TransferData(state.email, Money(state.currency, state.amount)),
                        );
                        result.fold(
                          (exception) => context.read<TransferCubit>().exceptionThrown(exception),
                          (success) => context.read<TransactionScreenCubit>().finishPressed(),
                        );
                      },
                      text: "TRANSFER",
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}