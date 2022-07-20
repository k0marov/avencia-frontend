import 'package:avencia/logic/features/deposit/domain/entities.dart';
import 'package:avencia/logic/features/deposit/domain/services.dart';
import 'package:avencia/logic/features/deposit/presentation/deposit_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../di.dart';
import '../../shared/simple_future_builder.dart';

String displayDuration(Duration d) => "${d.inMinutes}".padLeft(2, '0') + ":" + "${d.inSeconds % 60}".padLeft(2, '0');

class DepositCodePage extends StatelessWidget {
  const DepositCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SimpleFutureBuilder<TransactionCode>(
          future: sl<DepositCodeGetter>()(),
          loading: CircularProgressIndicator(),
          failureBuilder: (failure) => Text(failure.toString()),
          loadedBuilder: (codeEither) => BlocProvider(
              create: (_) => DepositCodeCubit(codeEither),
              child: BlocBuilder<DepositCodeCubit, DepositCodeState>(
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
