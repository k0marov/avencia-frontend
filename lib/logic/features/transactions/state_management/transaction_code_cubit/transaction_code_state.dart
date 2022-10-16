part of 'transaction_code_cubit.dart';

class TransactionCodeState extends Equatable {
  final TransactionCode code;
  final Duration leftToExpire;
  @override
  List get props => [code, leftToExpire];
  const TransactionCodeState(this.code, this.leftToExpire);
}
