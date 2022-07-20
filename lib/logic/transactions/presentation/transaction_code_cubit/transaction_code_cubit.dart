import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../internal/transaction_code.dart';

part "transaction_code_state.dart";

class TransactionCodeCubit extends Cubit<TransactionCodeState> {
  Timer? _timer;
  TransactionCodeCubit(TransactionCode code) : super(_computeState(code)) {
    _timer = Timer.periodic(
      Duration(seconds: 1),
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

typedef TransactionCodeCubitFactory = TransactionCodeCubit Function(TransactionCode);

TransactionCodeCubitFactory newTransactionCodeCubitFactory() => (code) => TransactionCodeCubit(code);
