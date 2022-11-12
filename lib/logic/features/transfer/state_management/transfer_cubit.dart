import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:avencia/logic/features/transfer/internal%20/transfer_data.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:helpers/logic/core.dart';

import '../../wallets/internal/values.dart';
import '../usecases.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  final TransferUseCase _transfer;
  TransferCubit(this._transfer, Wallet? selectedWallet)
      : super(TransferState(
            TransferData(
                "",
                selectedWallet ??
                    const Wallet(
                      id: "",
                      money: Money(baseCurrency, 0.0),
                    ),
                0.0),
            selectedWallet == null));

  void recipientChanged(String email) => emit(
        state.copyWith(data: state.data.copyWith(recipientEmail: email)),
      );
  void walletChanged(Wallet wallet) => emit(
        state.copyWith(data: state.data.copyWith(myWallet: wallet)),
      );
  void amountChanged(double amount) => emit(
        state.copyWith(data: state.data.copyWith(money: amount)),
      );
  void walletsShowToggled() => emit(state.copyWith(walletsShown: !state.walletsShown));
  void sendPressed() {
    emit(state.copyWith(sendState: None()));
    _transfer(state.data).then((res) => res.fold(
          (e) => emit(state.copyWith(sendState: Some(Left(e)))),
          (r) => emit(state.copyWith(sendState: Some(Right(true)))),
        ));
  }
}

typedef TransferCubitFactory = TransferCubit Function(Wallet? initialWallet);
