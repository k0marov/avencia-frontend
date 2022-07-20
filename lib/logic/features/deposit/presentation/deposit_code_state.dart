part of 'deposit_code_cubit.dart';

class DepositCodeState extends Equatable {
  final TransactionCode code;
  final Duration leftToExpire;
  @override
  List get props => [code, leftToExpire];
  const DepositCodeState(this.code, this.leftToExpire);
}
