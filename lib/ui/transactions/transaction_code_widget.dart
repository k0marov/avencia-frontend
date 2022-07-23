import 'package:avencia/logic/transactions/presentation/transaction_screen_cubit/transaction_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../config/const.dart';
import '../../di.dart';
import '../../logic/transactions/internal/transaction_code.dart';
import '../../logic/transactions/presentation/transaction_code_cubit/transaction_code_cubit.dart';
import '../core/gradient_button.dart';
import '../core/simple_future_builder.dart';
import '../shared/helpers.dart';

class TransactionCodeWidget extends StatelessWidget {
  final TransactionType type;
  const TransactionCodeWidget({Key? key, required this.type}) : super(key: key);

  static const _textStyle = TextStyle(fontSize: 24, fontStyle: FontStyle.italic);

  Widget _buildMainContent(TransactionCodeState? state) => Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: state != null
              ? QrImage(
                  eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.circle, color: Colors.black),
                  // embeddedImage: AssetImage("assets/logo_square_small.png"),
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
        onPressed: context.read<TransactionScreenCubit>().finishPressed,
        text: "FINISH",
      ),
      SimpleFutureBuilder<TransactionCode>(
        future: uiDeps.startTransaction(type),
        loading: _buildMainContent(null),
        exceptionBuilder: (exception) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Text("Oops, some error happened. Please, try again.",
              style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
              )),
        ),
        loadedBuilder: (code) => BlocProvider(
            create: (_) => uiDeps.transCodeCubitFactory(code),
            child: BlocBuilder<TransactionCodeCubit, TransactionCodeState>(
              builder: (context, state) => _buildMainContent(state),
            )),
      ),
    ]);
  }
}
