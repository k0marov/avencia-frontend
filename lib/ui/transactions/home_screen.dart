import 'package:avencia/config/const.dart';
import 'package:avencia/di.dart';
import 'package:avencia/logic/transactions/presentation/home_screen_cubit/home_screen_cubit.dart';
import 'package:avencia/ui/transactions/transaction_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/flat_color_button.dart';
import '../core/gradient_button.dart';
import '../core/logo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  List<Widget> _getMainChildren(HomeScreenState state, HomeScreenCubit b) {
    switch (state) {
      case HomeScreenState.initial:
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
        ];
      case HomeScreenState.depositing:
        return [
          TransactionCodeWidget(
            type: TransactionType.deposit,
          ),
        ];
      case HomeScreenState.withdrawing:
        return [
          TransactionCodeWidget(
            type: TransactionType.withdrawal,
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<HomeScreenCubit>(
          create: (_) => HomeScreenCubit(),
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) => ListView(
              children: [
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: LogoWidget(),
                ),
                if (state == HomeScreenState.initial) ...[
                  Text(
                    "Welcome!",
                    style: (Theme.of(context).textTheme.displaySmall ?? TextStyle()).copyWith(
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 35),
                ],
                ..._getMainChildren(state, context.read<HomeScreenCubit>()),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 6),
                  child: Divider(
                    thickness: 4,
                  ),
                ),
                FlatColorButton(
                  color: Colors.red.shade300,
                  onPressed: uiDeps.authFacade.logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
