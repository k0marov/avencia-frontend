import 'package:avencia/logic/transactions/presentation/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../config/const.dart';
import '../../di.dart';
import '../../logic/transactions/internal/transaction_code.dart';
import '../../logic/transactions/presentation/transaction_code_cubit/transaction_code_cubit.dart';
import '../shared/helpers.dart';
import '../shared/simple_future_builder.dart';
import 'gradient_button.dart';

class TransactionCodeWidget extends StatelessWidget {
  final TransactionType type;
  const TransactionCodeWidget({Key? key, required this.type}) : super(key: key);

  static const _textStyle = TextStyle(fontSize: 24, fontStyle: FontStyle.italic);

  Widget _buildMainContent(TransactionCodeState? state) => Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: state != null
              ? QrImage(
                  data: state.code.code,
                  version: QrVersions.auto,
                )
              : AspectRatio(aspectRatio: 1, child: Center(child: CircularProgressIndicator(strokeWidth: 16))),
        ),
        state != null
            ? state.leftToExpire.isNegative
                ? Text("Expired.", style: _textStyle.copyWith(color: Colors.red))
                : Text("Expires in ${displayDuration(state.leftToExpire)}", style: _textStyle)
            : Text("Loading...", style: _textStyle),
      ]);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GradientButton(
        onPressed: context.read<HomeScreenCubit>().finishPressed,
        text: "FINISH",
      ),
      SimpleFutureBuilder<TransactionCode>(
        future: uiDeps.getTransCode(type),
        loading: _buildMainContent(null),
        exceptionBuilder: (exception) => Text(exception.toString()),
        loadedBuilder: (code) => BlocProvider(
            create: (_) => uiDeps.transCodeCubitFactory(code),
            child: BlocBuilder<TransactionCodeCubit, TransactionCodeState>(
              builder: (context, state) => _buildMainContent(state),
            )),
      ),
    ]);
  }
}
