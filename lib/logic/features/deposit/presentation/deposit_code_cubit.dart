import 'dart:async';

import 'package:avencia/logic/features/deposit/domain/entities.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deposit_code_state.dart';

class DepositCodeCubit extends Cubit<DepositCodeState> {
  Timer? _timer;
  DepositCodeCubit(TransactionCode code) : super(_computeState(code)) {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_) => emit(
        DepositCodeState(state.code, state.leftToExpire - Duration(seconds: 1)),
      ),
    );
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    super.close();
  }

  static DepositCodeState _computeState(TransactionCode code) =>
      DepositCodeState(code, _computeLeftToExpire(code.expiresAt));
  static Duration _computeLeftToExpire(DateTime expiresAt) => expiresAt.difference(DateTime.now());
}
