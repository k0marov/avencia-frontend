import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers/ui/general/helpers.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../di.dart';
import '../../../logic/features/transactions/internal/values.dart';
import '../../../logic/features/transactions/state_management/transaction_code_cubit.dart';
import '../../core/widgets/gradient_button.dart';

class TransactionCodeWidget extends StatelessWidget {
  final MetaTransaction metaTrans;
  const TransactionCodeWidget({Key? key, required this.metaTrans}) : super(key: key);

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
                  aspectRatio: 1,
                  child: Center(child: CircularProgressIndicator(strokeWidth: 16)),
                ),
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
        onPressed: () => Navigator.of(context).pop(),
        content: Text("FINISH"),
      ),
      uiDeps.simpleBuilder<TransactionCode>(
        load: () => uiDeps.startTransaction(metaTrans),
        loadedBuilder: (context, code) => BlocProvider(
            create: (_) => uiDeps.transCodeCubitFactory(code),
            child: BlocBuilder<TransactionCodeCubit, TransactionCodeState>(
              builder: (context, state) => _buildMainContent(context, state),
            )),
      ),
    ]);
  }
}
