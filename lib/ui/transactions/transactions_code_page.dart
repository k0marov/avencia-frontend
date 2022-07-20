import 'package:avencia/config/const.dart';
import 'package:avencia/logic/transactions/presentation/transaction_code_cubit/transaction_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../di.dart';
import '../../logic/transactions/internal/transaction_code.dart';
import '../shared/simple_future_builder.dart';

String displayDuration(Duration d) => "${d.inMinutes}".padLeft(2, '0') + ":" + "${d.inSeconds % 60}".padLeft(2, '0');

class DepositCodePage extends StatelessWidget {
  const DepositCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SimpleFutureBuilder<TransactionCode>(
          future: uiDeps.getTransCode(TransactionType.deposit),
          loading: CircularProgressIndicator(),
          exceptionBuilder: (exception) => Text(exception.toString()),
          loadedBuilder: (code) => BlocProvider(
              create: (_) => uiDeps.transCodeCubitFactory(code),
              child: BlocBuilder<TransactionCodeCubit, TransactionCodeState>(
                builder: (context, state) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImage(
                      data: state.code.code,
                      version: QrVersions.auto,
                      size: 300.0,
                    ),
                    SizedBox(height: 20),
                    state.leftToExpire.isNegative
                        ? Text("Expired.", style: TextStyle(color: Colors.red))
                        : Text("Expires in ${displayDuration(state.leftToExpire)}")
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
