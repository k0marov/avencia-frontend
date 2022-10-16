import 'package:equatable/equatable.dart';

class MetaTransaction extends Equatable {
  final TransactionType type; 
  @override List get props => [type]; 
  const MetaTransaction(this.type); 
}

class TransactionCode extends Equatable {
  final String code;
  final DateTime expiresAt;
  @override
  List get props => [code, expiresAt];

  const TransactionCode(this.code, this.expiresAt);
}

enum TransactionType {
  deposit,
  withdrawal,
}

String transactionTypeValue(TransactionType tt) {
  switch (tt) {
    case TransactionType.deposit:
      return "deposit";
    case TransactionType.withdrawal:
      return "withdrawal";
  }
}
