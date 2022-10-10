import 'package:avencia/logic/transactions/internal/values.dart';
import 'package:avencia/logic/transactions/presentation/transaction_screen_cubit/transaction_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../di.dart';
import '../../logic/transactions/presentation/transaction_code_cubit/transaction_code_cubit.dart';
import '../core/buttons/gradient_button.dart';
import '../core/general/helpers.dart';
import '../core/general/simple_cubit_builder.dart';

class TransactionCodeWidget extends StatelessWidget {
  final TransactionType type;
  const TransactionCodeWidget({Key? key, required this.type}) : super(key: key);

  static const _textStyle = TextStyle(fontSize: 24, fontStyle: FontStyle.italic);

  Widget _buildMainContent(BuildContext context, TransactionCodeState? state) => Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: state != null
              ? QrImage(
                  eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.circle, color: Colors.black),
                  foregroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  data: state.code.code,
                  version: QrVersions.auto,
                )
              : const AspectRatio(
                  aspectRatio: 1, child: Center(child: CircularProgressIndicator(strokeWidth: 16))),
        ),
        state != null
            ? state.leftToExpire.isNegative
                ? Text("Expired.", style: _textStyle.copyWith(color: Colors.red))
                : Text("Expires in ${displayDuration(state.leftToExpire)}", style: _textStyle)
            : const Text("Loading...", style: _textStyle),
      ]);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GradientButton(
        onPressed: context.read<TransactionScreenCubit>().finishPressed,
        text: "FINISH",
      ),
      SimpleCubitBuilder<TransactionCode>(
        load: () => uiDeps.startTransaction(MetaTransaction(type)),
        loadedBuilder: (code, _) => BlocProvider(
            create: (_) => uiDeps.transCodeCubitFactory(code),
            child: BlocBuilder<TransactionCodeCubit, TransactionCodeState>(
              builder: (context, state) => _buildMainContent(context, state),
            )),
      ),
    ]);
  }
}
