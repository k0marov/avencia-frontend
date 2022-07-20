import 'package:equatable/equatable.dart';

class TransactionCode extends Equatable {
  final String code;
  final DateTime expiresAt;
  @override
  List get props => [code, expiresAt];

  const TransactionCode(this.code, this.expiresAt);
}
