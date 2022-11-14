import 'package:avencia/ui/features/transfer/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/simple_cubit.dart';

import '../../../logic/features/wallets/internal/values.dart';
import '../../core/widgets/gradient_button.dart';
import '../../core/widgets/icon_with_text.dart';
import '../../core/widgets/simple_button.dart';

// TODO: add usage of the dependency-getter files like theme.dart everywhere

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    const spacing = SizedBox(width: 5);
    final cubit = context.read<SimpleCubit<Wallets>>();
    final wallets = cubit.state.assertLoaded();
    return SizedBox(
      height: 45,
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SizedBox(
          width: 75,
          child: SimpleButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: TransferScreen(),
                ),
              ),
            ),
            contents: Text("Send"),
          ),
        ),
        spacing,
        Expanded(
          child: SizedBox(
            width: 150,
            child: SimpleButton(
              onPressed: () {},
              contents: IconWithText(
                icon: Icons.arrow_upward,
                text: Text("Withdraw"),
              ),
            ),
          ),
        ),
        spacing,
        Expanded(
          child: GradientButton(
            onPressed: () {},
            content: IconWithText(
              icon: Icons.arrow_downward,
              text: Text("Deposit"),
            ),
          ),
        ),
      ]),
    );
  }
}
