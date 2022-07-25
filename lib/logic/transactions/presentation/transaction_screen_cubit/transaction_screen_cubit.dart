import 'package:bloc/bloc.dart';

enum TransactionScreenState {
  initial,
  depositing,
  withdrawing,
  transfering,
}

class TransactionScreenCubit extends Cubit<TransactionScreenState> {
  TransactionScreenCubit() : super(TransactionScreenState.initial);

  void depositPressed() => emit(TransactionScreenState.depositing);
  void withdrawPressed() => emit(TransactionScreenState.withdrawing);
  void transferPressed() => emit(TransactionScreenState.transfering);
  void finishPressed() => emit(TransactionScreenState.initial);
}
