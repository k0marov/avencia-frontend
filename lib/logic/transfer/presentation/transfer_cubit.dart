import 'package:avencia/logic/core/money.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_state.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(const TransferState("", "", 0));

  void emailChanged(String email) => emit(state.withEmail(email));
  void currencySelected(Currency currency) => emit(state.withCurrency(currency));
  void amountChanged(MoneyAmount amount) => emit(state.withAmount(amount));
  void exceptionThrown(Exception exception) => emit(state.withException(exception));
}

typedef TransferCubitFactory = TransferCubit Function();

TransferCubitFactory newTransferCubitFactory() => () => TransferCubit();
