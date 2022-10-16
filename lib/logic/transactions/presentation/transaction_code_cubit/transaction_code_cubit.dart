import 'dart:async';

import 'package:avencia/logic/transactions/internal/values.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part "transaction_code_state.dart";

class TransactionCodeCubit extends Cubit<TransactionCodeState> {
  Timer? _timer;
  TransactionCodeCubit(TransactionCode code) : super(_computeState(code)) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => emit(_computeState(state.code)),
    );
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    super.close();
  }

  static TransactionCodeState _computeState(TransactionCode code) =>
      TransactionCodeState(code, _computeLeftToExpire(code.expiresAt));
  static Duration _computeLeftToExpire(DateTime expiresAt) => expiresAt.difference(DateTime.now());
}
