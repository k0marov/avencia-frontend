import 'package:equatable/equatable.dart';

enum TransactionSourceType {
  creditCard, 
  cash, 
  crypto, 
  transfer 
}

class TransactionSource extends Equatable {
  final TransactionSourceType type; 
  final String detail; 
  @override 
  List get props => [type, detail]; 
  const TransactionSource(this.type, this.detail); 
}

