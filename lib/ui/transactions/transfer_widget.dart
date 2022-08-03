import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/transactions/presentation/transaction_screen_cubit/transaction_screen_cubit.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';
import 'package:avencia/ui/core/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
import '../../logic/transfer/presentation/transfer_cubit.dart';

class TransferWidget extends StatelessWidget {
  const TransferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocProvider(
        create: (_) => uiDeps.transferCubitFactory(),
        child: BlocBuilder<TransferCubit, TransferState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: context.read<TransferCubit>().emailChanged,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: TextFormField(
                        onChanged: context.read<TransferCubit>().currencySelected,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9\.]"))],
                        onChanged: (amount) =>
                            context.read<TransferCubit>().amountChanged(double.tryParse(amount) ?? 0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Amount",
                        ),
                      ),
                    ),
                  ],
                ),
                if (state.exception != null) Text(state.exception.toString()),
                SizedBox(height: 20),
                Row(
                  children: [
                    GradientButton(
                      width: 150,
                      onPressed: context.read<TransactionScreenCubit>().finishPressed,
                      text: "CANCEL",
                    ),
                    Spacer(),
                    GradientButton(
                      onPressed: () async {
                        final result =
                            await uiDeps.transfer(TransferData(state.email, Money(state.currency, state.amount)));
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
