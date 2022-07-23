import 'package:bloc/bloc.dart';

enum TransactionScreenState {
  initial,
  depositing,
  withdrawing,
}

class TransactionScreenCubit extends Cubit<TransactionScreenState> {
  TransactionScreenCubit() : super(TransactionScreenState.initial);

  void depositPressed() => emit(TransactionScreenState.depositing);
  void withdrawPressed() => emit(TransactionScreenState.withdrawing);
  void finishPressed() => emit(TransactionScreenState.initial);
}
